import 'package:shop_app/api/api_get_list_cart.dart';
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';

class CartViewModel {
  static Future<ListCartResponse> getListCart() async {
    CartService service = new CartService();
    var result = await service.getListCart();
    return result;
  }

  Future<bool?> addListCart(List<AddToCarRequest> listCartRequest)
  async {
    CartService services = new CartService();
    try {
      return await services.addListCart(listCartRequest);
      return true;
    } catch (Exception) {
      
      print("lỗi nè:"+Exception.toString());
    }
    return false;
  }

  Future<AddToCartResponse?> addToCart(AddToCarRequest cart)
  async {
    CartService services = new CartService();
    try {
      return await services.addToCart(cart);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }
}
