
import 'package:shop_app/models/Cart.dart';

class CheckOutProducts {
    late List<Cart> carts;
    late double _total;
  CheckOutProducts(){
    carts = [];
    int _total = 0;
  }

  void addCart(Cart cart){
    carts.add(cart);
  }

  void removeCart(int id){
    carts.removeWhere((cart) => cart.product.id == id);
  }

  void computeTotal(){
    double total = 0;
    for (var cart in carts) {
      total += cart.numOfItem*cart.product.price;
    }
    _total = total;
  }
}