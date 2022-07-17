
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/blocs/order_bloc.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/screens/orders_status/process_timeline_screen.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/view_model/order_view_model.dart';
import 'package:shop_app/view_model/product_view_model.dart';

class Body extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateBody();
}

class _StateBody extends State<Body>{
  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List products = <Content>[];
  int testValue = 1;
  final StorageService _storageService = StorageService();
  OrderBloc _orderBloc = new OrderBloc();

  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
     //call api
     var token = await getUserToken();
      var response = await getListOrder(page, token!);
      setState(() {
        isLoading = false;
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

  Future<OrdersResponse> getListOrder(int page, String token) async {
    var result = await _orderBloc.getListOrder(page, token);
    return result;
  }

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

   void dispose() {
    _sc.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    // TODO: implement build
    //var orders = OrderViewModel.getListOrder();
    return SingleChildScrollView(
      controller: _sc,
            padding: EdgeInsets.only(top: 10.0),
            child:ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length + 1,
              itemBuilder: (context, int index) {
                if(index == products.length){
            return _buildProgressIndicator();
          }
          else{
              return 
              GestureDetector(
                child: Card(
                  color: Color(0xFFF5F6F9),
                  child: 
                  Column(children: [
ListTile(
                    enabled: products[index].status.toString() != "Đã nhận hàng",
                    title: Text("Mã đơn hàng: "+products[index].orderId.toString()),
                    //leading: Text("Ngày đặt: "+snapshot.data!.content![i].createDate!),
                    subtitle: Text('Tổng số tiền:'+ formatter.format(products[index].totalPrice)),
                    trailing: Text('Trạng thái:'+ products[index].status.toString())
                  ),
                  Text("Ngày đặt: "+ products[index].createDate!)
                  ],)
                  
                ),
                onTap: () 
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(orders[i])));
                   => Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ProcessTimelinePage(products[index].orderId!)),
                    ),
                
              );}
            }),
          );
          }

          Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
    }

