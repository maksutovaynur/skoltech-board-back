from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import Post, Profile, ProfileLink, Reaction, Tag


class ProfileAdmin(UserAdmin):
    pass


# Register your models here.

admin.site.register(Profile, ProfileAdmin)
admin.site.register(ProfileLink)
admin.site.register(Post)
admin.site.register(Tag)
admin.site.register(Reaction)
