from django.db import models as M
from board.enums import ProfileType, mk_choices
from rest_framework.serializers import ModelSerializer
from django.contrib.auth.models import AbstractUser


class Profile(AbstractUser):
    created_dttm = M.DateTimeField(auto_now_add=True)
    type = M.IntegerField(null=False, choices=mk_choices(ProfileType), default=ProfileType.PERSON)

    class Meta:
        db_table = 'skolboard_profile'


class ProfileLink(M.Model):
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='links')
    link = M.URLField(null=False)
    description = M.CharField(null=True, max_length=256)

    class Meta:
        db_table = 'skolboard_profile_link'


class FullProfileLinkSerializer(ModelSerializer):
    class Meta:
        model = ProfileLink
        fields = ['id', 'link', 'description']
        read_only_fields = ['id']


class ProfileLinkSerializer(ModelSerializer):
    class Meta:
        model = ProfileLink
        fields = ['link', 'description']


class ProfileSerializer(ModelSerializer):
    links = ProfileLinkSerializer(many=True, required=False)

    class Meta:
        model = Profile
        fields = ['id', 'created_dttm', 'first_name', 'last_name', 'password', 'email',
                  'type', 'links']
        read_only_fields = ['id', 'created_dttm']
        extra_kwargs = {'password': {'write_only': True}}
