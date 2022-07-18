import 'package:flutter/material.dart';
import 'package:shop_app/blocs/feedback_bloc.dart';
import 'package:shop_app/models/get_list_feedback_model.dart';
import 'package:shop_app/screens/otp/components/otp_form.dart';
import 'package:shop_app/view_model/feedback_view_model.dart';

import 'feedback_item.dart';
import 'image_banner.dart';
import 'rating_feedback.dart';

class Body extends StatelessWidget {

  Body({required this.urlImage, this.productId, this.avarageRating});
  final String? urlImage;
  final int? productId;
  final double? avarageRating;
  

   
   
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: [
          Container(
            color: Colors.grey[100],
       child: Image.network(urlImage!, height: 300 ),
          ),
        ListFeedBack(productId,avarageRating)
      ]
    );
  }
}

class ListFeedBack extends StatefulWidget {
  ListFeedBack(this.productId, this.avarageRaing);
  final int? productId;
  final double? avarageRaing;
  @override
  State<StatefulWidget> createState() => ListFeedbackState();
}

class ListFeedbackState extends State<ListFeedBack>{
   int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  var products = <Content>[];
  int testValue = 1;
  FeedbackBloc _feedbackBloc = new FeedbackBloc();


Future<GetListFeedback> getListFeedback(int page, int productId) async {
    
    var result = await _feedbackBloc.getListFeedback(page, productId);
    return result;
  }

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
      var response = await getListFeedback(page, widget.productId!);
      setState(() {
        isLoading = false;
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

   void dispose() {
    _sc.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
        child: Column(
      children: [
        RatingAndFeedback(averageRating: widget.avarageRaing),
        ...List.generate(products.length, (index) => FeedbackItem(
          products[index].customerName, 
        products[index].rate, products[index].createDate, 
        products[index].content)),
        //FeedbackItem("Khoa Wjpu", 5, "13:00 19/10/2021", "kimochiiii"),
      ],
    ));
  }
}