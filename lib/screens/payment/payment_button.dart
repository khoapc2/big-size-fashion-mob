import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/blocs/cart_bloc.dart';
import 'package:shop_app/blocs/order_bloc.dart';
import 'package:shop_app/blocs/zalopay_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/add_order_response_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/payment_request_model.dart';
import 'package:shop_app/models/zalo_response_model.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/service/storage_service.dart';

import '../../list_cart.dart';
import '../../location.dart';
import '../../locator.dart';
import '../../size_config.dart';

class PaymentButton extends StatelessWidget{
  var currentListCart = locator.get<ListCart>();
   var locationSelected = locator.get<Location>();
    final StorageService _storageService = StorageService();
    late ZaloResponse _zaloPayResponse;
    OrderBloc _orderBloc = new OrderBloc();
   String? payResult; 
   ZaloPayBloc _zaloBloc = new ZaloPayBloc();
   CartBloc _cartBloc = new CartBloc();
     
Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  Future<ZaloResponse> createOrderFromZaloPay(double totalPrice, String token) async {
    
    var result = await _zaloBloc.createOrder(totalPrice, token);
    return result;
  }
 Future<AddOrderResponse> addOrder(PaymentResquest resquest, String token) async {
    
    AddOrderResponse result = new AddOrderResponse();
    try{
       result = await _orderBloc.addOrder(resquest, token);
    return result;
    }catch(exception){
      print(exception);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    // TODO: implement build
    return 
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if(token.hasData){
          return Container(
      
                      height:137.0,
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: 
                        Column(children: [
                          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("T???ng ti???n", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text("${formatter.format(currentListCart.total + currentListCart.shippingFee)} VN??", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10),
                         DefaultButton(
                          text: "Thanh to??n",
                          press: () async {
                              var paymentMethod = currentListCart.paymentMethod;
                              var request = new PaymentResquest(
                                deliveryAddress: locationSelected.locationId,
                                orderType: true,
                                paymentMethod: paymentMethod == 0 ? "Tr??? sau" : "Zalopay",
                                promotionPrice: 0,
                                totalPrice: currentListCart.total,
                                shippingFee: currentListCart.shippingFee,
                                storeId: currentListCart.storeId,
                                totalAfterDiscount: currentListCart.total
                                );
                                
                                
                            if(paymentMethod != 0){
                               _zaloPayResponse = await createOrderFromZaloPay(currentListCart.total, token.data!);
                             
                              FlutterZaloPaySdk.payOrder(zpToken: _zaloPayResponse.content!.zpTransToken!).listen((event) async {
                              //launch(zaloPayResponse.content!.orderUrl!);
                              switch (event) {
                  case FlutterZaloPayStatus.cancelled:
                    _showToast(context, "Kh??ch h??ng Hu??? Thanh To??n");
                    break;
                  case FlutterZaloPayStatus.success:
                    await addOrder(request, token.data!);
                    _showToast(context, "Thanh to??n b???ng zalopay th??nh c??ng");
                    updateCart(token.data!);
                    break;
                  case FlutterZaloPayStatus.failed:
                   _showToast(context, "Thanh to??n th???t b???i");
                    break;
                  default:
                    _showToast(context, "Thanh to??n th???t b???i");
                    break;
                }
                              });
                            }
                            else{
                                await addOrder(request, token.data!);
                                updateCart(token.data!);
                                _showToast(context, "Thanh to??n th??nh c??ng");
                            }
                            currentListCart.setListCart(null);
                                currentListCart.total = 0;
                                locationSelected.setLocationId(null);
                                currentListCart.setPaymentMethod(0);
                                Navigator.pushNamed(context, HomeScreen.routeName);
                             
                          
                          },
                        ),],)
                       
                      );
        }else{
          return _buildProgressIndicator();
        }
    });
    
  }

   void _showToast(BuildContext context, String payResult) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(payResult),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  void updateCart(String token){
    List<AddToCarRequest> listCart = [];
    addListCart(listCart, token);
  }

   Future<bool?> addListCart(List<AddToCarRequest> listCartRequest, String token)
  async {
    CartBloc services = new CartBloc();
    try {
      return await services.addListCart(listCartRequest, token);
    } catch (Exception) {
      
      print("l???i n??:"+Exception.toString());
    }
    return false;
  }
}