import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/blocs/cart_bloc.dart';
import 'package:shop_app/blocs/detail_product_bloc.dart';
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
import '../orders_status/process_timeline_screen.dart';

class PaymentButton extends StatelessWidget{
  var currentListCart = locator.get<ListCart>();
   var locationSelected = locator.get<Location>();
    final StorageService _storageService = StorageService();
    late ZaloPayResponse _zaloPayResponse;
    OrderBloc _orderBloc = new OrderBloc();
   String? payResult; 
   ZaloPayBloc _zaloBloc = new ZaloPayBloc();
   DetailProductBloc _detailProductBloc = new DetailProductBloc();

   static const MethodChannel platform = MethodChannel('flutter.native/channelPayOrder');
     
Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  Future<ZaloPayResponse> createOrderFromZaloPay(double totalPrice, String token) async {
    
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
                  Text("Tổng tiền", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text("${formatter.format(currentListCart.totalAfterDiscount + currentListCart.shippingFee)} VNĐ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10),
                         DefaultButton(
                          text: "Thanh toán",
                          press: () async {
                              var paymentMethod = currentListCart.paymentMethod;
                              print("Mã địa chỉ "+locationSelected.locationId.toString());
                              if(locationSelected.locationId == null){
                                _showToast(context, "Chọn địa chỉ để nhận hàng");
                              }else{
                                showLoading(context);
                                // String? error = await exceedQuantityError();
                                // if(error != ""){
                                //     showAlertDialog(context, error!);
                                //     //Navigator.pop(context);
                                //     return;
                                // }
                                var request = new PaymentResquest(
                                  deliveryAddress: locationSelected.locationId,
                                  orderType: true,
                                  paymentMethod: paymentMethod == 0 ? "Trả sau" : "ZaloPay",
                                  promotionPrice: 0,
                                  totalPrice: currentListCart.total,
                                  shippingFee: currentListCart.shippingFee,
                                  storeId: currentListCart.storeId,
                                  zpTransId: "",
                                  //storeId: 2,
                                  totalAfterDiscount: currentListCart.totalAfterDiscount
                                );
                                
                                
                            if(paymentMethod != 0){
                               _zaloPayResponse = await createOrderFromZaloPay(currentListCart.totalAfterDiscount + currentListCart.shippingFee, token.data!);
                              
                              request.zpTransId = _zaloPayResponse.content!.zpTransId;
                              
                              FlutterZaloPaySdk.payOrder(zpToken: _zaloPayResponse.content!.zpTransToken!).listen((event) async {
                              //launch(zaloPayResponse.content!.orderUrl!);
                              switch (event) {
                  case FlutterZaloPayStatus.cancelled:
                    _showToast(context, "Khách hàng Huỷ Thanh Toán");
                    break;
                  case FlutterZaloPayStatus.success:
                    var orderResponse = await addOrder(request, token.data!);
                    _showToast(context, "Thanh toán bằng ZaloPay thành công");
                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProcessTimelinePage(orderResponse.content!.orderId!),
                )); 
                    updateCart(token.data!);
                    break;
                  case FlutterZaloPayStatus.failed:
                   _showToast(context, "Thanh toán thất bại");
                    Navigator.pop(context);
                    break;
                  default:
                    _showToast(context, "Thanh toán thất bại");
                    Navigator.pop(context);
                    break;
                }
                              }); 
                            }
                            else{
                                var orderResponse = await addOrder(request, token.data!);
                                updateCart(token.data!);
                                _showToast(context, "Thanh toán thành công");
                //                 Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ListOrderScreen()),
                // ); Code có thể sẽ mở
                
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProcessTimelinePage(orderResponse.content!.orderId!),
                )); 

                            }
                            currentListCart.setListCart(null);
                                currentListCart.totalAfterDiscount = 0;
                                currentListCart.total = 0;
                                currentListCart.shippingFee = 0;
                                locationSelected.setLocationId(null);
                                currentListCart.setPaymentMethod(0);
                                
                             
                              }
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
      
      print("lỗi nè:"+Exception.toString());
    }
    return false;
  }

  showLoading(context) {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text(
                    "Đang xử lí...",
                    style: TextStyle(fontFamily: "QuicksandMedium"),
                  )
                ],
              ),
            ),
          );
        });
  }

  showAlertDialog(context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Thông báo"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<String?> exceedQuantityError() async {
    String error = "";
    for(var cart in currentListCart.listCart!){
        int actualQuantity = await getTotalByProductDetailId(cart.productDetailId!); 
        if(cart.quantity! > actualQuantity){
            error += cart.productName! + " "+cart.size.toString()+"-"+cart.color.toString() + " chỉ còn " + actualQuantity.toString()+"\n";
        }
    }
    return error;
  }

Future<int> getTotalByProductDetailId(int productDetailId) async {
       var response = await  _detailProductBloc.getQuantityByProductId(productDetailId);
       return response.content!.quantity!;
  }

}