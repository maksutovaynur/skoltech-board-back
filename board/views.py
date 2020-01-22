from rest_framework.viewsets import ModelViewSet
from board.models import post, tag, profile


class PostViewSet(ModelViewSet):
    queryset = post.Post.objects.all()
    serializer_class = post.PostSerializer

