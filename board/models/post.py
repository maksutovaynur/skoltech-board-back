from django.db import models as M
from board.models.profile import Profile
from board.enums import ReactionType, mk_choices


class Post(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='posts')
    title = M.CharField(null=False, max_length=256)
    body = M.TextField(null=False)

    class Meta:
        db_table = 'skolboard_post'


class Reaction(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    owner = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='reactions')
    post = M.ForeignKey(Post, null=False, on_delete=M.CASCADE, related_name='reactions')
    description = M.TextField(null=True, default=None)
    type = M.IntegerField(null=False, choices=mk_choices(ReactionType))


class Tag(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    name = M.CharField(null=False, max_length=64)

    class Meta:
        db_table = 'skolboard_tag'


class PostTagRelation(M.Model):
    post = M.ForeignKey(Post, null=False, on_delete=M.CASCADE, related_name='tags')
    tag = M.ForeignKey(Tag, null=False, on_delete=M.CASCADE, related_name='tags')

    class Meta:
        db_table = 'skolboard_post_tag_relation'
