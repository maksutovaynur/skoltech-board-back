from rest_framework.viewsets import ModelViewSet
from board.models import post, tag, profile


class PostViewSet(ModelViewSet):
    queryset = post.Post.objects.all()
    serializer_class = post.PostSerializer


class ProfileViewSet(ModelViewSet):
    queryset = profile.Profile.objects.all()
    serializer_class = profile.ProfileSerializer


class ProfileLinkViewSet(ModelViewSet):
    queryset = profile.ProfileLink.objects.all()
    serializer_class = profile.ProfileLinkSerializer


class ReactionViewSet(ModelViewSet):
    queryset = post.Reaction.objects.all()
    serializer_class = post.ReactionSerializer


class TagViewSet(ModelViewSet):
    queryset = tag.Tag.objects
    serializer_class = tag.TagSerializer
