from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("admin/", admin.site.urls),
    path("cart/", include("myshop.cart.urls", namespace="cart")),
    path("orders/", include("myshop.orders.urls", namespace="orders")),
    path("payment/", include("myshop.payment.urls", namespace="payment")),
    path("", include("myshop.shop.urls", namespace="shop")),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
