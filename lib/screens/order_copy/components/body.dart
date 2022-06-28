
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/screens/orders_status/process_timeline_screen.dart';
import 'package:shop_app/view_model/order_view_model.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var orders = OrderViewModel.getListOrder();
    return 
    FutureBuilder(
      future: orders,
      builder: (BuildContext context, AsyncSnapshot<OrdersResponse> snapshot){
          if(snapshot.hasData){
           return SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.0),
            child:ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.content!.length,
              itemBuilder: (context, int i) {
              return new GestureDetector(
                child: Card(
                  color: Color(0xFFF5F6F9),
                  child: ListTile(
                    enabled: snapshot.data!.content![i].status.toString() != "Đã nhận hàng",
                    title: Text("Mã đơn hàng: "+snapshot.data!.content![i].orderId.toString()),
                    subtitle: Text('Tổng số tiền:'+ snapshot.data!.content![i].totalPrice.toString()),
                    trailing: Text('Trạng thái:'+ snapshot.data!.content![i].status.toString())
                  ),
                ),
                onTap: () 
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(orders[i])));
                   => Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ProcessTimelinePage(snapshot.data!.content![i].orderId!)),
                    ),
                
              );
            }),
          );
          }
          else{
            return Container();
          }
    });
    
  }
}

