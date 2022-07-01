

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/get_address_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/screens/add_address/add_address_screen.dart';
import 'package:shop_app/screens/orders_status/process_timeline_screen.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';
import 'package:shop_app/view_model/address_view_model.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../location.dart';


class Body extends StatelessWidget{
  var locationSelected = locator.get<Location>();
  @override
  Widget build(BuildContext context) {
    var getAddresses = AddressViewModel.getAddress();
    // TODO: implement build
    return 
    FutureBuilder(
      future: getAddresses,
      builder: (BuildContext context, AsyncSnapshot<GetAddressesResponse> snapshot){
          if(snapshot.hasData){
              return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: listAddress(snapshot.data!, context)
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

  List<Widget> listAddress(GetAddressesResponse data, BuildContext context){
    return List.generate(data.content!.length, (index) =>
    GestureDetector(
      onTap:() {
          print(data.content![index].receiveAddress!);
          locationSelected.setLocation(data.content![index].receiveAddress!);
          print(locationSelected.location);
          locationSelected.setLocationId(data.content![index].addressId!);
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

