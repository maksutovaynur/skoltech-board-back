from board import views as V
from rest_framework.routers import DefaultRouter


router = DefaultRouter(trailing_slash=True)
router.register('posts', V.PostViewSet, base_name='posts')
router.register('tags', V.TagViewSet, base_name='tags')
router.register('links', V.LinkViewSet, base_name='links')
router.register('profiles', V.ProfileViewSet, base_name='profiles')
router.register('reactions', V.ReactionViewSet, base_name='reactions')

urlpatterns = router.urls