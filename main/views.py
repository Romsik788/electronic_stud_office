from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from main.models import appraisal, faculty, group, student_subject, subject
from django.urls import reverse_lazy
from django.contrib import messages
from django.core.mail import send_mail
from main.models import student
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes, force_text
from django.contrib.auth import authenticate, login, logout
from . tokens import generate_token


def index(request):
    if request.user.is_authenticated:
        return redirect('/main')
    if request.method == 'POST':
        username = request.POST['username']
        pass1 = request.POST['password']
        
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
        identification_code = request.POST['ident_code']
        pass1 = request.POST['password1']
        pass2 = request.POST['password2']
        error = False

        if User.objects.filter(username=username):
            messages.error(request, "Такий логін вже існує")
            error = True
        
        if User.objects.filter(email=email).exists():
            messages.error(request, "Такий email вже зареєстрований")
            error = True
        if not student.objects.filter(identification_code=identification_code) or not (list(student.objects.filter(id = stud_id))[0].identification_code == list(student.objects.filter(identification_code=identification_code))[0].identification_code):
            messages.error(request, "Студента не знайдено")
            error = True

        if len(username)>150:
            messages.error(request, "Логін має містити не більше 150 символів")
            error = True
        
        if pass1 != pass2:
            messages.error(request, "Паролі не збігаються")
            error = True

        if error:  return redirect('/signup')
        _student = list(student.objects.filter(identification_code=identification_code))
        myuser = User.objects.create_user(username, email, pass1)
        myuser.first_name = ''
        myuser.last_name = ''
        myuser.is_active = True
        myuser.save()   
        _student[0].user_id = myuser.id
        _student[0].save()
        return redirect('/main')
    return render(request, "main/register.html")

def activate(request):
    if not request.user.is_authenticated:
        return redirect('/signin')
    return render(request, "main/activate.html")

def main_page(request):
    if not request.user.is_authenticated:
        return redirect('/signin')
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
    return render(request, 'main/home_page.html', context)

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
    return render(request, 'main/marks.html', context)

def signout(request):
    logout(request)
    return redirect('/signin')

def redirect_to_main(request):
    return redirect('/main')
