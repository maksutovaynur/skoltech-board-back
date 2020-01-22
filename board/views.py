from rest_framework.viewsets import ModelViewSet
from board.models import post, tag, profile
from rest_framework.request import Request
from rest_framework.authentication import SessionAuthentication, BaseAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly, BasePermission, SAFE_METHODS


class ReadOnly(BasePermission):
    def has_permission(self, request: Request, view):
        return request.method in SAFE_METHODS


class PostViewSet(ModelViewSet):
    queryset = post.Post.objects.all()
    serializer_class = post.PostSerializer


class ProfileViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = profile.Profile.objects.all()
    serializer_class = profile.ProfileSerializer


class ProfileLinkViewSet(ModelViewSet):
    # permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = profile.ProfileLink.objects.all()
    serializer_class = profile.ProfileLinkSerializer


class ReactionViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = post.Reaction.objects.all()
    serializer_class = post.ReactionSerializer


class TagViewSet(ModelViewSet):
    permission_classes = [ReadOnly]
    queryset = tag.Tag.objects.all()
    serializer_class = tag.TagSerializer


class LinkViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = profile.ProfileLink.objects.all()
    serializer_class = profile.ProfileLinkSerializer
