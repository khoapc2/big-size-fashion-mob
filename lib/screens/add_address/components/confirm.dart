import 'package:flutter/material.dart';
import 'package:shop_app/blocs/address_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/add_address_request_model.dart';
import 'package:shop_app/models/add_address_response_model.dart';
import 'package:shop_app/screens/address/address_copy_screen.dart';
import 'package:shop_app/service/storage_service.dart';
import '../../../size_config.dart';

class PaymentButton extends StatelessWidget {
  PaymentButton(
      {required this.receiver,
      this.phoneNumber,
      this.address,
      this.city,
      this.state});
   TextEditingController? receiver;
   TextEditingController? address;
   TextEditingController? phoneNumber;
   String? city;
   String? state;
  AddAddressRequest request = new AddAddressRequest();
  AddressBloc _addAddressBloc = new AddressBloc();

  final StorageService _storageService = StorageService();

  Future<AddAddressResponse?> addToAddress(
      AddAddressRequest cart, String token) async {
    try {
      return await _addAddressBloc.addToAddress(cart, token);
    } catch (Exception) {
      print("lỗi nè:" + Exception.toString());
    }
  }

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: getUserToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                height: 137.0,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: getProportionateScreenWidth(40),
                  top: getProportionateScreenWidth(15),
                ),
                child: Column(
                  children: [
                    DefaultButton(
                      text: "Xác nhận",
                      press: () async {
                        String erros = "";
                        if (address!.text == "") {
                          erros = "Nhập địa chỉ\n";
                        }
                        if (receiver!.text == "") {
                          erros += "Nhập tên người nhận\n";
                        }
                        if (phoneNumber!.text == "") {
                          
                          erros += "Nhập số điện thoại\n";
                        }
                        else{
                          if(phoneNumber!.text.substring(0,1) != "0" || phoneNumber!.text.length != 10){
                          erros += "Nhập đúng số điện thoại\n";
                        }
                        }
                        
                        if (city == "") {
                          erros += "Nhập thành phố\n";
                        }
                        if (state == "") {
                          erros += "Nhập tỉnh\n";
                        }

                        if (erros == "") {
                          request.receiveAddress = address!.text + ", "+
        city!+", "+state!;
                          request.receiverName = receiver!.text;
                          request.receiverPhone = phoneNumber!.text;
                          addToAddress(request, snapshot.data!);
                          _showToast(context, "Thêm địa chỉ thành công");
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressScreen()),
                          );
                        } else {
                          showAlertDialog(context, erros);
                        }
                        //print(address);
                      },
                    ),
                  ],
                ));
          } else {
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
        action: SnackBarAction(
            label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  showAlertDialog(context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
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
}
