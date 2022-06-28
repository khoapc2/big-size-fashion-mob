
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/src/connector_theme.dart';
import 'package:shop_app/src/connectors.dart';
import 'package:shop_app/src/indicators.dart';
import 'package:shop_app/src/timeline_theme.dart';
import 'package:shop_app/src/timeline_tile_builder.dart';
import 'package:shop_app/src/timelines.dart';

import '../../widget.dart';
import 'components/body.dart';
import 'components/feedback_button.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class ProcessTimelinePage extends StatelessWidget{
  ProcessTimelinePage(this._orderId);
int _processIndex = 4;
int _orderId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Chi tiết đơn hàng', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      ),
      body: Body(_orderId),
     
      bottomNavigationBar:  FeedbackButton(_processIndex)
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component

