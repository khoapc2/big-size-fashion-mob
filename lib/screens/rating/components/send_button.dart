

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/screens/rating/components/body.dart';
import 'package:shop_app/view_model/feedback_view_model.dart';

class SendButton extends StatelessWidget{
  SendButton(this.createFeedback);
  final CreateFeedback createFeedback;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
              onTap: () {
                CreateFeedbackRequest request = new CreateFeedbackRequest();
                request.content = createFeedback.context;
                request.productId = createFeedback.productId;
                request.rate = createFeedback.rating!.round();
                      new FeedbackViewModel().createFeedback(request);
                      _showToast(context);
                    },
              child: Container(
              alignment: Alignment.center,
              height: 50.0,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: new LinearGradient(colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(150, 0, 0, 0)
                  ])),
              padding: const EdgeInsets.all(0),
              child: Text(
                "Gửi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "QuickSandBold",
                  fontSize: 30,
                ),
              ),
            ),
            );
  }

   void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Đã bình luận thành công'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}