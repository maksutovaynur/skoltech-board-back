from django.db import models as M
from board.enums import ProfileType, mk_choices


class Profile(M.Model):
    name = M.CharField(null=False, max_length=256)
    email = M.EmailField(null=False)
    type = M.IntegerField(null=False, choices=mk_choices(ProfileType))

    class Meta:
        db_table = 'skolboard_profile'


class ProfileLink(M.Model):
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='links')
    link = M.URLField(null=False)
    description = M.CharField(null=True, max_length=256)

    class Meta:
        db_table = 'skolboard_profile_link'
