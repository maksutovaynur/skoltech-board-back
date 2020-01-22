from django.db import models as M
from board.models.profile import Profile
from board.enums import ReactionType, mk_choices
from rest_framework.serializers import ModelSerializer


class Post(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='posts')
    title = M.CharField(null=False, max_length=256)
    body = M.TextField(null=False)

    class Meta:
        db_table = 'skolboard_post'


class PostSerializer(ModelSerializer):
    class Meta:
        model = Post
        fields = ['id', 'created_dttm', 'profile', 'title', 'body']
        read_only_fields = ('id', 'created_dttm')


class Reaction(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    owner = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='reactions')
    post = M.ForeignKey(Post, null=False, on_delete=M.CASCADE, related_name='reactions')
    description = M.TextField(null=True, default=None)
    type = M.IntegerField(null=False, choices=mk_choices(ReactionType))

    class Meta:
        db_table = 'skolboard_reaction'

