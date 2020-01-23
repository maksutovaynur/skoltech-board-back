from django.db import models as M
from rest_framework.serializers import ModelSerializer
from board.enums import TagLevel, mk_choices


class Tag(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    name = M.CharField(null=False, max_length=64)
    level = M.IntegerField(null=False, choices=mk_choices(TagLevel))

    class Meta:
        db_table = 'skolboard_tag'


class TagSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'created_dttm', 'name', 'level']
        read_only_fields = ('id', 'created_dttm')

#
# class PostTagRelation(M.Model):
#     post = M.ForeignKey(Post, null=False, on_delete=M.CASCADE, related_name='tags')
#     tag = M.ForeignKey(Tag, null=False, on_delete=M.CASCADE, related_name='tags')
#
#     class Meta:
#         db_table = 'skolboard_post_tag_relation'

