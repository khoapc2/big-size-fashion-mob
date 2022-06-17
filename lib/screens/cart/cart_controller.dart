


import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';

class CartController extends GetxController {
      List<Cart>? listCart;
      var total = 0.0.obs;
      CartController({
          this.listCart
      }
      );

      void increment() {
        total = (total.value + 1).obs;
        update();
        } 

      void updateTotal(double total){
          total = total;
      }

      RxDouble getTotal(){
        return total;
      }
       setTotal(){

        listCart!.forEach((cart) { total  = (cart.numOfItem*cart.product.price).obs;});
      }

      void addToCart(Cart cart){
        listCart!.add(cart);
        setTotal();
      }

      void test(Cart cart){
          total = cart.product.price.obs;
      }
}

