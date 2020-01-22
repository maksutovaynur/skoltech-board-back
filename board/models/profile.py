from django.db import models as M
from board.enums import ProfileType, mk_choices
from rest_framework.serializers import ModelSerializer, HyperlinkedModelSerializer, CharField, PrimaryKeyRelatedField
from django.contrib.auth.models import AbstractUser


class Profile(AbstractUser):
    created_dttm = M.DateTimeField(auto_now_add=True)
    type = M.IntegerField(null=False, choices=mk_choices(ProfileType), default=ProfileType.PERSON)
    telegram_chat_id = M.CharField(null=True, default=None, max_length=256)

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
    profile = PrimaryKeyRelatedField

    class Meta:
        model = ProfileLink
        fields = ['link', 'description', 'profile']


class ProfileSerializer(HyperlinkedModelSerializer):
    links = ProfileLinkSerializer(many=True, required=False)
    username = CharField(min_length=3)
    password = CharField(min_length=3, style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = Profile
        fields = ['id', 'created_dttm', 'first_name', 'last_name', 'username', 'password', 'email',
                  'type', 'links']
        read_only_fields = ['id', 'created_dttm']
