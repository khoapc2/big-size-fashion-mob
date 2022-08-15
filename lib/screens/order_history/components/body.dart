import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/blocs/order_bloc.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/screens/orders_status/process_timeline_screen.dart';
import 'package:shop_app/service/storage_service.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateBody();
}

class _StateBody extends State<Body> {
  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List products = <Content>[];
  int testValue = 1;
  final StorageService _storageService = StorageService();
  OrderBloc _orderBloc = new OrderBloc();
  TextEditingController birthDay = TextEditingController();
  
  

  void initState() {
    
    super.initState();
    
    DateTime now = new DateTime.now();
    String bd = "";
                    if ((now.day >= 10) && (now.month >= 10)) {
                      bd = now.day.toString() +
                          "/" +
                          now.month.toString() +
                          "/" +
                          now.year.toString();
                    }
                    if ((now.day < 10) && (now.month >= 10)) {
                      bd = "0" +
                          now.day.toString() +
                          "/" +
                          now.month.toString() +
                          "/" +
                          now.year.toString();
                    }
                    if ((now.day >= 10) && (now.month < 10)) {
                      bd = now.day.toString() +
                          "/0" +
                          now.month.toString() +
                          "/" +
                          now.year.toString();
                    }
                    if ((now.day < 10) && (now.month < 10)) {
                      bd = "0" +
                          now.day.toString() +
                          "/0" +
                          now.month.toString() +
                          "/" +
                          now.year.toString();
                    }
                    print(bd);
                    birthDay.text = bd;
    _getMoreData(bd);
  }

  void _getMoreData(String bd) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      //call api
      var token = await getUserToken();
      var response = await getListOrder(token!,bd);
      setState(() {
        isLoading = false;
        products = <Content>[];
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

  Future<OrdersResponse> getListOrder(String token, String bd) async {
    var result = await _orderBloc.getListOrder(token, bd);
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 80,
            child: TextField(
              controller: birthDay,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
                contentPadding: const EdgeInsets.only(
                    top: 0, left: 20, bottom: 0, right: 10),
              ),
              style: const TextStyle(
                fontFamily: "QuicksandMedium",
                fontSize: 20,
              ),
              //enabled: false,
              readOnly: true,
              focusNode: FocusNode(),
              enableInteractiveSelection: false,
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1950, 1, 1),
                  maxTime: DateTime(2022, 12, 31),
                  theme: const DatePickerTheme(
                    headerColor: Color(0x1000ADFF),
                    backgroundColor: Color(0xFFFFFFFF),
                    itemStyle: TextStyle(
                      color: Color(0xFF00ADFF),
                      fontFamily: "QuickSandBold",
                      fontSize: 20,
                    ),
                    doneStyle: TextStyle(
                      color: Color(0xFF0085C3),
                      fontSize: 20,
                      fontFamily: "QuickSandBold",
                    ),
                    cancelStyle: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20,
                      fontFamily: "QuickSandBold",
                    ),
                  ),
                  onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  },
                  onConfirm: (date) {
                    print('confirm $date');
                    String bd = "";
                    if ((date.day >= 10) && (date.month >= 10)) {
                      bd = date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day < 10) && (date.month >= 10)) {
                      bd = "0" +
                          date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day >= 10) && (date.month < 10)) {
                      bd = date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day < 10) && (date.month < 10)) {
                      bd = "0" +
                          date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    print(bd);
                    birthDay.text = bd;
                    _getMoreData(bd);
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.vi,
                );
              },
            ),
          ),
          products.length != 0?
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length + 1,
              itemBuilder: (context, int index) {
                if (index == products.length) {
                  return _buildProgressIndicator();
                } else {
                  return GestureDetector(
                    child: Card(
                        color: Color(0xFFF5F6F9),
                        child: Column(
                          children: [
                            ListTile(
                                enabled: products[index].status.toString() !=
                                    "Đã nhận hàng",
                                title: Text("Mã đơn hàng: " +
                                    products[index].orderId.toString()),
                                //leading: Text("Ngày đặt: "+snapshot.data!.content![i].createDate!),
                                subtitle: Text('Tổng số tiền:' +
                                    formatter.format(products[index]
                                        .totalPriceAfterDiscount)),
                                trailing: Text('Trạng thái:' +
                                    products[index].status.toString())),
                            Text("Ngày đặt: " + products[index].createDate!)
                          ],
                        )),
                    onTap: ()
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(orders[i])));
                        =>
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProcessTimelinePage(products[index].orderId!)),
                    ),
                  );
                }
              }): Center(child: Text("Chưa có đơn hàng nào"))
        ],
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(const Radius.circular(10)),
        borderSide: const BorderSide(
          color: Color(0xFF00ADFF),
          width: 2,
        ));
  }

  OutlineInputBorder myinputborder() {
    return const OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ));
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
