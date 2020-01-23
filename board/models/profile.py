from django.db import models as M
from board.enums import ProfileType, mk_choices
from rest_framework.serializers import ModelSerializer, Serializer, CharField, PrimaryKeyRelatedField
from django.contrib.auth.models import AbstractUser
import logging


log = logging.getLogger('Profile')


class Profile(AbstractUser):
    created_dttm = M.DateTimeField(auto_now_add=True)
    type = M.IntegerField(null=False, choices=mk_choices(ProfileType), default=ProfileType.PERSON)
    telegram_chat_id = M.CharField(null=True, default=None, blank=True, max_length=256)

    class Meta:
        db_table = 'skolboard_profile'


class ProfileLink(M.Model):
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='links')
    link = M.URLField(null=False)
    description = M.CharField(null=True, max_length=256, blank=True)

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


class ProfileSerializer(ModelSerializer):
    links = ProfileLinkSerializer(many=True, required=False, read_only=True)
    username = CharField(min_length=3)
    password = CharField(min_length=3, style={'input_type': 'password'}, write_only=True)
    telegram_chat_id = CharField(required=False, default=None)

    class Meta:
        model = Profile
        fields = ['id', 'created_dttm', 'first_name', 'last_name', 'username', 'password', 'email',
                  'type', 'links', 'telegram_chat_id']
        read_only_fields = ['id', 'created_dttm']

    def create(self, validated_data):
        user = Profile.objects.create_user(**validated_data)
        return user

    def update(self, instance: Profile, validated_data):
        for k, v in validated_data.items():
            setattr(instance, k, v)
        instance.set_password(raw_password=validated_data['password'])
        instance.save()
        return instance

