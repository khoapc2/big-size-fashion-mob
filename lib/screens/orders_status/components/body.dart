

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/blocs/order_bloc.dart';
import 'package:shop_app/blocs/order_detail_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/cancel_order_response_model.dart';
import 'package:shop_app/models/order_detail_model.dart';
import 'package:shop_app/screens/order_history/list_order_screen.dart';
import 'package:shop_app/screens/orders_status/components/order_detail.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/src/connector_theme.dart';
import 'package:shop_app/src/connectors.dart';
import 'package:shop_app/src/indicators.dart';
import 'package:shop_app/src/timeline_theme.dart';
import 'package:shop_app/src/timeline_tile_builder.dart';
import 'package:shop_app/src/timelines.dart';

import '../../../size_config.dart';


const kTileHeight = 50.0;

const completeColor = Colors.grey;
const inProgressColor = kPrimaryColor;
const todoColor = Color(0xffd1d2d7);

class _BezierPainter extends CustomPainter {
  _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;
  

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

class Body extends StatelessWidget{
  
  int _processIndex = 0;
  int _orderId;
  Body(this._orderId);
  OrderDetailBloc _orderDetailBloc = new OrderDetailBloc();
  OrderBloc _orderBloc = new OrderBloc();
  final StorageService _storageService = StorageService();

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return kPrimaryColor;
    } else {
      return todoColor;
    }
  }

  Future<OrderDetailResponse> getOrderDetail(int orderId) async {
    var result = await _orderDetailBloc.getOrderDetail(orderId);
    return result;
  }

   Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if(token.hasData){
    var orderDetailResponse = getOrderDetail(_orderId);
    return FutureBuilder(
      future: orderDetailResponse,
      builder: (BuildContext context, AsyncSnapshot<OrderDetailResponse> snapshot){
        if(snapshot.hasData){
         switch (snapshot.data!.content!.status) {
          case "???? h???y":
          _processIndex = -1;
          break;
           case "Ch??? x??c nh???n":
             _processIndex = 0;
             break;
             case "???? x??c nh???n":
             _processIndex = 1;
             break;
             case "???? ????ng g??i":
              _processIndex = 2;
             break;
             case "??ang giao":
             _processIndex = 3;
             break;
             case "???? nh???n h??ng":
             _processIndex = 4;
             break;
             
           default:
            _processIndex = 5;
            break;
         }
 return 
    ListView(
        children: [
          Container(
            height: 200.0,
            child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 30.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
              MediaQuery.of(context).size.width / _processes.length,
          oppositeContentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Image.asset(
                'assets/icons/process_timeline/status${index + 1}.png',
                width: 50.0,
                color: getColor(index),
              ),
            );
          },
          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                _processes[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: getColor(index),
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index == _processIndex) {
              color = inProgressColor;
              child = Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (index < _processIndex) {
              color = kPrimaryColor;
              child = Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
            }

            if (index <= _processIndex) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(30.0, 30.0),
                    painter: _BezierPainter(
                      color: color,
                      drawStart: index > 0,
                      drawEnd: index < _processIndex,
                    ),
                  ),
                  DotIndicator(
                    size: 30.0,
                    color: color,
                    child: child,
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(15.0, 15.0),
                    painter: _BezierPainter(
                      color: color,
                      drawEnd: index < _processes.length - 1,
                    ),
                  ),
                  OutlinedDotIndicator(
                    borderWidth: 4.0,
                    color: color,
                  ),
                ],
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == _processIndex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)!
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: _processes.length,
        ),
      )
          ),
          //N??t h???y
          GestureDetector(onTap: (){
                 cancelOrder(_orderId, token.data!);
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListOrderScreen()),
                );
                }, 
                child: _processIndex == 0?
                    Container(
                      margin: EdgeInsets.only(left: 200, right: 10),
                      
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                      ),
                      child: 
                      Center(
                        child:Text("H???y ????n h??ng",style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white)),
                        )
                    ): Container(),
                ),
          OrderDetail(snapshot.data!)
        ],
      );
        }else{
          return Container(
            child: _buildProgressIndicator(),
          );
        }
       
      },
    );
        }else{
          return _buildProgressIndicator();
        }
      
    }
    
    );
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

  Future<CancelOrderResponse?> cancelOrder(int orderId, String token)
  async {

    try {
      return await _orderBloc.cancelOrder(orderId, token);
    } catch (Exception) {
      print("l???i n??:"+Exception.toString());
    }
  }
}


  
final _processes = [
  'X??c th???c',
  '????ng g??i',
  'V???n chuy???n',
  'Nh???n h??ng',
];