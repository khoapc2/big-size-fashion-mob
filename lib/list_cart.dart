import 'models/cart_model.dart';

class ListCart{
  List<Content>? listCart;
  double total = 0;

  List<Content>? getListCart(){
    return this.listCart;
  }

  void setListCart(List<Content>? listCart){
      this.listCart = listCart;
  }

  void setTotal(){
    this.listCart!.forEach((cart) { this.total += (cart.quantity!*cart.productPrice!);});
  }
}