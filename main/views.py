from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from main.models import appraisal, faculty, group, student_subject, subject, teacher, teacher_subject
from django.contrib import messages
from main.models import student
from django.contrib.auth import authenticate, login, logout
import json
from . tokens import generate_token


def index(request):
    if request.user.is_authenticated:
        return redirect('/main')
    if request.method == 'POST':
        username = request.POST['username']
        pass1 = request.POST['password']
        body = request.body
        user = authenticate(username=username, password=pass1)
        
        if user is not None:
            login(request, user)
            return redirect('/main')
        else:
            messages.error(request, "Логін або пароль неправильний")
            return redirect('/signin')
    
    return render(request, "main/index.html")

def signup(request):
    if request.user.is_authenticated:
        return redirect('/main')
    if request.method == "POST":
        username = request.POST['username']
        email = request.POST['email']
        stud_id = request.POST['id']
        iden_code = request.POST['ident_code']
        pass1 = request.POST['password1']
        pass2 = request.POST['password2']
        error = False

        if User.objects.filter(username=username):
            messages.error(request, "Такий логін вже існує")
            error = True
        
        if User.objects.filter(email=email).exists():
            messages.error(request, "Такий email вже зареєстрований")
            error = True
        if not iden_code.isdigit():
            messages.error(request, "Некоректне поле індентифікаційного коду")
            error = True
        elif not student.objects.filter(identification_code = iden_code) and not teacher.objects.filter(identification_code = iden_code):
            messages.error(request, "Студента чи викладача не знайдено")
            error = True
        if len(username)>150:
            messages.error(request, "Логін має містити не більше 150 символів")
            error = True
        
        if pass1 != pass2:
            messages.error(request, "Паролі не збігаються")
            error = True

        if error:  return redirect('/signup')
        if student.objects.filter(identification_code = iden_code):
            object = list(student.objects.filter(identification_code=iden_code))
        else:
            object = list(teacher.objects.filter(identification_code=iden_code))
        myuser = User.objects.create_user(username, email, pass1)
        myuser.first_name = ''
        myuser.last_name = ''
        myuser.is_active = True
        myuser.save()   
        object[0].user_id = myuser.id
        object[0].save()
        return redirect('/main')
    return render(request, "main/register.html")

def activate(request):
    if not request.user.is_authenticated:
        return redirect('/signin')
    return render(request, "main/activate.html")

def isTeacher(request):
    try:
        teacher.objects.get(user_id = request.user.id)
    except:
        return False
    return True

def main_page(request):

    if not request.user.is_authenticated:
        return redirect('/signin')
    
    if isTeacher(request): 
        return teacher_info(request)
    try:
        IStudent = student.objects.get(user_id = request.user.id)
    except:
        if request.user.is_superuser: return redirect('/admin')
        return redirect('/activate')
    IGroup = group.objects.get(id = IStudent.group_id)
    IFaculty = faculty.objects.get(id = IGroup.id_faculty)
    context = {
        'student': IStudent,
        'user': request.user,
        'group': IGroup,
        'faculty': IFaculty,
    }
    return render(request, 'main/student/home_page.html', context)

def marks(request):
    if not request.user.is_authenticated:
        return redirect('/signin')
    try:
        IStudent = student.objects.get(user_id = request.user.id)
    except:
        return redirect('/activate')
    IMarks = list(appraisal.objects.filter(student_id = IStudent.id))
    ISubjectList = list(student_subject.objects.filter(student_id = IStudent.id))
    ISubject = list(subject.objects.filter(id = ISubjectList[0].subject_id))
    for i in range(1, len(ISubjectList)):
        ISubject += list(subject.objects.filter(id = ISubjectList[i].subject_id))
    context = {
        'subject': ISubject,
        'mark': IMarks,
    }
    return render(request, 'main/student/marks.html', context)

def signout(request):
    logout(request)
    return redirect('/signin')

def redirect_to_main(request):
    return redirect('/main')

def teacher_info(request):
    try:
        ITeacher = teacher.objects.get(user_id = request.user.id)
    except:
        return redirect('/activate')
    IFaculty = faculty.objects.get(id = ITeacher.faculty_id)
    context = {
        'teacher': ITeacher,
        'user': request.user,
        'faculty': IFaculty,
    }
    return render(request, 'main/teacher/home_page.html', context)

def subjects(request):
    if not request.user.is_authenticated:
        return redirect('/signin')
    try:
        ITeacher = teacher.objects.get(user_id = request.user.id)
    except:
        return redirect('/activate')
    if request.method == "DELETE":
        body = request.body
        body = json.loads(body.decode("utf-8"))
        if not body['id'] == "null":
            IMark = appraisal.objects.get(id = int(body['id']))
            IMark.delete()
    if request.method == "PUT":
        body = request.body
        body = json.loads(body.decode("utf-8"))
        if not body['id'] == "null":
            IMark = appraisal.objects.get(id = int(body['id']))
            IMark.description = body['description']
            IMark.date = body['date']
            IMark.appraisal = body['appraisal']
            IMark.save()
            return JsonResponse({'id': 'null'})
        else:
            IMark = appraisal(description = body['description'], date = body['date'], appraisal = body['appraisal'], subject_id = body['subj_id'], student_id = body['stud_id'])
            IMark.save()
            return JsonResponse({'id': IMark.id, 'desc': IMark.description, 'date': IMark.date, 'appraisal': IMark.appraisal})

    ISubjectList = list(teacher_subject.objects.filter(teacher_id = ITeacher.id))
    ISubject = list(subject.objects.filter(id = ISubjectList[0].subject_id))
    for i in range(1, len(ISubjectList)):
        ISubject += list(subject.objects.filter(id = ISubjectList[i].subject_id))
    IStudentList = list(student_subject.objects.filter(subject_id = ISubject[0].id))
    for i in range(1, len(ISubject)):
        IStudentList += list(student_subject.objects.filter(subject_id = ISubject[i].id))
    _IStudentList = list(student.objects.filter(id = IStudentList[0].student_id))
    for i in range(1, len(IStudentList)):
        _IStudentList += list(student.objects.filter(id = IStudentList[i].student_id))

    IMarks = list(appraisal.objects.filter(student_id = IStudentList[0].student_id))
    for i in range(1, len(_IStudentList)):
        IMarks += list(appraisal.objects.filter(student_id = IStudentList[i].student_id))
    
    context = {
        'subject': ISubject,
        'student_sub': IStudentList,
        'student': _IStudentList,
        'mark': IMarks,
    }
    return render(request, 'main/teacher/subjects.html', context)

def CodeError404(request, exception=None):
    print("test")
    return redirect('/main')