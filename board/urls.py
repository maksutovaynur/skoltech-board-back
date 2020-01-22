from board import views as V
from rest_framework.routers import DefaultRouter

router = DefaultRouter(trailing_slash=True)
router.register('posts', V.PostViewSet)
router.register('tags', V.TagViewSet)
router.register('profiles', V.ProfileViewSet)
router.register('reactions', V.ReactionViewSet)

urlpatterns = router.urls