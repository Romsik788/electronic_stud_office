from django.contrib import admin

from .models import appraisal, group, student

admin.site.register(student)
admin.site.register(group)
admin.site.register(appraisal)