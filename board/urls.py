from board import views as V
from rest_framework.routers import DefaultRouter


router = DefaultRouter(trailing_slash=True)
router.register('posts', V.PostViewSet, basename='posts')
router.register('tags', V.TagViewSet, basename='tags')
router.register('links', V.LinkViewSet, basename='links')
router.register('profiles', V.ProfileViewSet, basename='profiles')
router.register('reactions', V.ReactionViewSet, basename='reactions')

urlpatterns = router.urls