import django_filters as F
from rest_framework.viewsets import ModelViewSet
from board.models import post, tag, profile, Post
from rest_framework.request import Request
from rest_framework.permissions import IsAuthenticatedOrReadOnly, BasePermission, SAFE_METHODS
from django_filters.rest_framework import DjangoFilterBackend
import logging

log = logging.getLogger("Lol")

class ReadOnly(BasePermission):
    def has_permission(self, request: Request, view):
        return request.method in SAFE_METHODS


class PostViewSet(ModelViewSet):
    def get_queryset(self):
        qs = post.Post.objects
        tags = self.request.query_params.get('tags', None)
        try: tags = eval(tags)
        except: tags = None
        if isinstance(tags, list):
            for t in tags:
                qs = qs.filter(tags=t)
        log.info(f"Tags: {tags}, type: {type(tags)}")
        return qs.all()
    serializer_class = post.PostSerializer
    # filter_backends = [DjangoFilterBackend]
    filterset_fields = {
        'created_dttm': ['gte', 'lte', 'range'],
        # 'tags': ['exact'],
        'profile': ['exact'],
        'profile__type': ['exact']
    }


class ProfileViewSet(ModelViewSet):
    queryset = profile.Profile.objects.all()
    serializer_class = profile.ProfileSerializer
    filterset_fields = {
        'created_dttm': ['gte', 'lte', 'range'],
        'type': ['exact']
    }


class ProfileLinkViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = profile.ProfileLink.objects.all()
    serializer_class = profile.ProfileLinkSerializer


class ReactionViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = post.Reaction.objects.all()
    serializer_class = post.ReactionSerializer
    filterset_fields = {
        'type': ['in'],
        'post': ['exact'],
        'post__profile': ['exact'],
        'post__tags': ['exact'],
        'owner': ['exact'],
    }


class TagViewSet(ModelViewSet):
    permission_classes = [ReadOnly]
    queryset = tag.Tag.objects.all()
    serializer_class = tag.TagSerializer
    filterset_fields = {
        'level': ['exact']
    }


class LinkViewSet(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = profile.ProfileLink.objects.all()
    serializer_class = profile.ProfileLinkSerializer


from django.contrib.auth import authenticate, login, logout
from rest_framework.views import APIView
from django.http.response import JsonResponse


class LoginView(APIView):
    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(request=request, username=username, password=password)
        if user is None:
            return JsonResponse(status=401, data={'error': 'Authentication failed'})
        login(request, user=user)
        sr = profile.ProfileSerializer(user)
        return JsonResponse(data=sr.data)


class LogoutView(APIView):
    def post(self, request, *args, **kwargs):
        logout(request)
        return JsonResponse(data={'username': None})


class RefreshTelegramChannelId(APIView):
    def post(self, request, *args, **kwargs):
        uid = request.data.get('user_id')
        tid = request.data.get('telegram_chat_id')
        profile.Profile.objects.select_for_update().filter(pk=uid).update(telegram_chat_id=tid)
        return JsonResponse(data=dict(user_id=uid, telegram_chat_id=tid))
