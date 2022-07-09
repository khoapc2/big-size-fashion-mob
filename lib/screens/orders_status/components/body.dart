

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/order_detail_model.dart';
import 'package:shop_app/screens/orders_status/components/order_detail.dart';
import 'package:shop_app/src/connector_theme.dart';
import 'package:shop_app/src/connectors.dart';
import 'package:shop_app/src/indicators.dart';
import 'package:shop_app/src/timeline_theme.dart';
import 'package:shop_app/src/timeline_tile_builder.dart';
import 'package:shop_app/src/timelines.dart';
import 'package:shop_app/view_model/order_detail_view_model.dart';


const kTileHeight = 50.0;

const completeColor = Colors.grey;
const inProgressColor = kPrimaryColor;
const todoColor = Color(0xffd1d2d7);

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
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
  

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return kPrimaryColor;
    } else {
      return todoColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    var orderDetailResponse = OrderDetailViewModel.getOrderDetail(_orderId);
    return FutureBuilder(
      future: orderDetailResponse,
      builder: (BuildContext context, AsyncSnapshot<OrderDetailResponse> snapshot){
        if(snapshot.hasData){
         switch (snapshot.data!.content!.status) {
           case "Chờ xác nhận":
             _processIndex = 0;
             break;
             case "Đã xác nhận":
             _processIndex = 1;
             break;
             case "Đã đóng gói":
              _processIndex = 2;
             break;
             case "Đang giao":
             _processIndex = 3;
             break;
             case "Đã nhận hàng":
             _processIndex = 4;
             break;
             
           default:
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
}
final _processes = [
  'Xác thực',
  'Đóng gói',
  'Vận chuyển',
  'Nhận hàng',
];