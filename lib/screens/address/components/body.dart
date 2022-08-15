

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/blocs/address_bloc.dart';
import 'package:shop_app/blocs/store_bloc.dart';
import 'package:shop_app/models/delete_address_response.dart';
import 'package:shop_app/models/ge_nearest_store_model.dart';
import 'package:shop_app/models/get_address_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/screens/add_address/add_address_screen.dart';
import 'package:shop_app/screens/orders_status/process_timeline_screen.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/view_model/address_view_model.dart';
import 'package:shop_app/view_model/store_view_model.dart';

import '../../../constants.dart';
import '../../../list_cart.dart';
import '../../../locator.dart';
import '../../../location.dart';


class Body extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateBody();
}

class _StateBody extends State<Body>{
  var locationSelected = locator.get<Location>();
  var currentListCart = locator.get<ListCart>();
  final StorageService _storageService = StorageService();
  final AddressBloc _addressBloc = new AddressBloc();
  final StoreBloc _storeBloc = new StoreBloc();

  late Future<GetAddressesResponse> _customerAddress;
  
  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  //phoneNumber

  

  Future<GetAddressesResponse> getAddress(String token) async {
    var result = await _addressBloc.getAddress(token);
    return result;
  }

  Future<GetNearestStoreModel> getNearestStores(String address, String token) async {
    var result = await _storeBloc.getNearestStore(address, token);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if (token.hasData) {
            _customerAddress= getAddress(token.data!);
            return FutureBuilder<GetAddressesResponse?>(
      future: _customerAddress,
      builder: (context, snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.content!.length == 0){
              return Center(child: Text("Không có địa chỉ nào"));
            }
              return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: listAddress(snapshot.data!, token.data!)
            // [
                
            //     Container(
            //       width: double.infinity,
            //       padding: EdgeInsets.all(30.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         // color: Colors.grey.shade200
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.grey.shade200,
            //             Colors.grey.shade100,
            //             Colors.grey.shade200,
            //             Colors.grey.shade300,
            //           ],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //         )
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text("Long Nguyen", style: TextStyle(color: Colors.black, fontSize: 18),),
            //                   Icon(Icons.person, color: kPrimaryColor)
            //                 ],
            //               ),
            //               SizedBox(height: 10),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text("(+84) 01234465643", style: TextStyle(color: Colors.black, fontSize: 18),),
            //                   Icon(Icons.phone, color: kPrimaryColor)
            //                 ],
            //               ),
            //               SizedBox(height: 10),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     width: 230.0,
            //                     child: Text("123 Nguyễn Trung Trực, Q. Tân Bình, TPHCM", style: TextStyle(color: Colors.black, fontSize: 18),)
            //                   ),
            //                   Icon(Icons.location_on, color: kPrimaryColor)
            //                 ],
            //               ),

            //             ],
            //           ),

            //         ]
            //       ),
                  
            //     ),
            //     SizedBox(height: 10),
            //     Container(
            //       width: double.infinity,
            //       padding: EdgeInsets.all(30.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         // color: Colors.grey.shade200
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.grey.shade200,
            //             Colors.grey.shade100,
            //             Colors.grey.shade200,
            //             Colors.grey.shade300,
            //           ],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //         )
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text("(+84) 589833394", style: TextStyle(color: Colors.black, fontSize: 18),),
            //                 ],
            //               ),
            //               SizedBox(height: 10),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     width: 230.0,
            //                     child: Text("123 Đường 265, Q.9,TP. Thủ Đức", style: TextStyle(color: Colors.black, fontSize: 18),)
            //                   ),
            //                   Icon(Icons.location_on, color: kPrimaryColor)
            //                 ],
            //               ),

            //             ],
            //           ),

            //         ]
            //       ),
                  
            //     )
            // ]
          )
          )
          );
          }
          else{
            return Container();
          }
    });
        }
        return _buildProgressIndicator();
    });
    // TODO: implement build
    
    
  }
  Future<deleteAddressResponse> deleteAddress(int addressId, String token) async {
    var result = await _addressBloc.deleteAddress(addressId, token);
    return result;
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

   Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child:  CircularProgressIndicator(),
        ),
    );
  }

  List<Widget> listAddress(GetAddressesResponse data, String token){
    return List.generate(data.content!.length, (index) =>
    GestureDetector(
      onTap:() async {
        showLoading(context);
          print(data.content![index].receiveAddress!);
          locationSelected.setLocation(data.content![index].receiveAddress!);
          print(locationSelected.location);
          locationSelected.setLocationId(data.content![index].addressId!);
          print(locationSelected.locationId);
        var response =  await getNearestStores(data.content![index].receiveAddress!, token);
        currentListCart.setShippingFee(response.content!.shippingFee!);
        currentListCart.setStoreId(response.content!.storeId);
          print("Tiền phí vận chuyển là:"+currentListCart.shippingFee.toString());
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
      } ,
      child: 
      Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.person, color: kPrimaryColor),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(data.content![index].receiverName!, style: TextStyle(color: Colors.black, fontSize: 18),),
                              ),
                              GestureDetector(
                                onTap: () => setState(() {
                                    deleteAddress(data.content![index].addressId!, token);
                                }),
                                child: Container(
                                margin: EdgeInsets.only(left: 40),
                                child: 
                              SvgPicture.asset("assets/icons/Trash.svg"))
                              )
                              
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, color: kPrimaryColor),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(data.content![index].receiverPhone!, style: TextStyle(color: Colors.black, fontSize: 18),),)
                              
                              
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: kPrimaryColor),
                              Container(
                                width: 230.0,
                                child: Text(data.content![index].receiveAddress!, style: TextStyle(color: Colors.black, fontSize: 18),)
                              ),
                              
                            ],
                          ),

                        ],
                      ),

                    ]
                  ),
                  
                ))
    );

    
  }
}

