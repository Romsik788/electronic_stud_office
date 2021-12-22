from django.contrib.auth.models import User
from django.db import models
from django.db.models.fields import CharField, IntegerField

class student(models.Model):
    student_name = models.CharField(max_length=100)
    course = models.IntegerField()
    budget = models.BooleanField()
    group_id = models.IntegerField()
    user_id = models.BigIntegerField()
    phone = models.CharField(max_length=15)
    identification_code = models.IntegerField()

    def __str__(self):
        return self.student_name
    class Meta:
        db_table = "student"

class student_subject(models.Model):
    student_id = models.BigIntegerField()
    subject_id = models.BigIntegerField()
    
    def __str__(self):
        return str(self.subject_id)
    class Meta:
        db_table = "student_subject"

class teacher_subject(models.Model):
    teacher_id = models.BigIntegerField()
    subject_id = models.BigIntegerField()

    class Meta:
        db_table = "teacher_subject"

class group(models.Model):
    group_name = models.CharField(max_length=100)
    student_count = models.IntegerField()
    id_faculty = models.BigIntegerField()

    def __str__(self):
        return self.group_name
    class Meta:
        db_table = "groups"

class faculty(models.Model):
    faculty_name = models.CharField(max_length=100)
    groups_count = models.IntegerField()

    class Meta:
        db_table = "facultys"

class appraisal(models.Model):
    description = models.CharField(max_length=100)
    appraisal = models.IntegerField()
    date = models.DateField()
    subject_id = models.BigIntegerField()
    student_id = models.BigIntegerField()

    def __str__(self):
        return self.description
    class Meta:
        db_table = "appraisals"

class subject(models.Model):
    subject_name = models.CharField(max_length=100)

    def __str__(self):
        return self.subject_name
    class Meta:
        db_table = "subject"

class teacher(models.Model):
    name = CharField(max_length=100)
    position = CharField(max_length=100)
    faculty_id = IntegerField()
    user_id = models.BigIntegerField()
    phone = models.CharField(max_length=15)
    identification_code = models.IntegerField()

    def __str__(self):
        return self.name
    class Meta:
        db_table = "teachers"