from django.db import models as M
from . import Post


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
