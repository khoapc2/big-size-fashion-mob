import 'models/cart_model.dart';

class ListCart{
  List<Content>? listCart;
  double totalAfterDiscount = 0;
  double total = 0;
  double shippingFee = 0;
  int? storeId = 0;
  int paymentMethod = 0;

  void setPaymentMethod(int paymentMethod){
    this.paymentMethod = paymentMethod;
  }

  List<Content>? getListCart(){
    return this.listCart;
  }

  void setListCart(List<Content>? listCart){
      this.listCart = listCart;
  }

  void setTotal(){
    this.listCart!.forEach((cart) { 
        if(cart.productPromotion == null){
            totalAfterDiscount += (cart.quantity!*cart.productPrice!);
        }else{
          totalAfterDiscount += (cart.quantity! * cart.productPromotion!);
        }
        });
  }

  void setShippingFee(double shippingFee){
    this.shippingFee = shippingFee;
  }

  void setStoreId(int? storeId){
    this.storeId = storeId;
  }
}