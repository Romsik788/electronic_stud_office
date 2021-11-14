from django.contrib import admin

from .models import castom_user, group, student

admin.site.register(student)
admin.site.register(castom_user)
admin.site.register(group)