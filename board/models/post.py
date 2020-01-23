from django.db import models as M
from board.models.profile import Profile, ProfileSerializer
from board.models.tag import Tag, TagSerializer
from board.enums import ReactionType, mk_choices
from rest_framework.serializers import ModelSerializer, PrimaryKeyRelatedField, ListField


class Post(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    profile = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='posts')
    title = M.CharField(null=False, max_length=256)
    body = M.TextField(null=False)
    tags = M.ManyToManyField(Tag, related_name='posts', db_table='skolboard_post_tags')

    class Meta:
        db_table = 'skolboard_post'


class PostSerializer(ModelSerializer):
    tags = TagSerializer(many=True)
    # tag_ids = ListField(PrimaryKeyRelatedField(pk_field='id', queryset=Tag.objects.all()), source='tags')
    profile = ProfileSerializer(read_only=True, many=False)
    profile_id = PrimaryKeyRelatedField(write_only=True, queryset=Profile.objects.all(), source='profile')

    class Meta:
        model = Post
        fields = ['id', 'created_dttm', 'profile', 'profile_id', 'title', 'body', 'tags']
        read_only_fields = ('id', 'created_dttm', 'profile')


class Reaction(M.Model):
    created_dttm = M.DateTimeField(auto_now_add=True)
    owner = M.ForeignKey(Profile, null=False, on_delete=M.CASCADE, related_name='reactions')
    post = M.ForeignKey(Post, null=False, on_delete=M.CASCADE, related_name='reactions')
    description = M.TextField(null=True, default=None, blank=True)
    type = M.IntegerField(null=False, choices=mk_choices(ReactionType))

    class Meta:
        db_table = 'skolboard_reaction'


class ReactionSerializer(ModelSerializer):
    class Meta:
        model = Reaction
        fields = ['id', 'created_dttm', 'owner', 'post', 'description', 'type']
        read_only_fields = ['id', 'created_dttm']


