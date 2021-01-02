from django.contrib import admin

# Register your models here.
from .models import Production
from .models import Consume
from .models import Manufacture

admin.site.register(Production)
admin.site.register(Consume)
admin.site.register(Manufacture)
