import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/api/api_address.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/add_address_request_model.dart';
import 'package:shop_app/models/add_address_response_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/payment_request_model.dart';
import 'package:shop_app/screens/address_copy/address_copy_screen.dart';
import 'package:shop_app/screens/details%20copy/components/top_rounded_container.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/view_model/address_view_model.dart';
import 'package:shop_app/view_model/cart_view_model.dart';
import 'package:shop_app/view_model/order_view_model.dart';
import 'package:shop_app/view_model/zalo_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../size_config.dart';

class PaymentButton extends StatelessWidget{
     
     PaymentButton({required this.receiver, this.phoneNumber, this.address});
     final String? receiver;
     final String? address;
     final String? phoneNumber;
     AddAddressRequest request = new AddAddressRequest();
     AddressService _addAddressBloc  = new AddressService();

     final StorageService _storageService = StorageService();


     Future<AddAddressResponse?> addToAddress(AddAddressRequest cart, String token)
  async {
    try {
      return await _addAddressBloc.addToAddress(cart,token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(builder: (context, snapshot){
      if(snapshot.hasData){
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
                         DefaultButton(
                          text: "Xác nhận",
                          press: () async {
                            request.receiveAddress = address;
                            request.receiverName = receiver;
                            request.receiverPhone = phoneNumber;
                            addToAddress(request, snapshot.data!);
                            _showToast(context, "Thêm địa chỉ thành công");
                            Navigator.push(
                        context,
                     MaterialPageRoute(builder: (context) => AddressScreen()),
                    );
                            //print(address);
                          },
                        ),],)
                       
                      );
      }
      else{
return _buildProgressIndicator();
      }
    });
    // TODO: implement build
    
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

   void _showToast(BuildContext context, String payResult) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(payResult),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}