from board.views import PostViewSet
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
router.register(r'posts', PostViewSet)

urlpatterns = router.urls