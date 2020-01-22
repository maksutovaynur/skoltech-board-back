from django.contrib import admin

from .models import Post, Profile, ProfileLink, Reaction, Tag, PostTagRelation
# Register your models here.

admin.site.register(Profile)
admin.site.register(ProfileLink)
admin.site.register(Post)
admin.site.register(Tag)
admin.site.register(PostTagRelation)
admin.site.register(Reaction)
