

import 'package:flutter/material.dart';
import 'package:shop_app/blocs/feedback_bloc.dart';
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/models/create_feedback_response_model.dart';
import 'package:shop_app/screens/rating/components/body.dart';
import 'package:shop_app/service/storage_service.dart';

class SendButton extends StatelessWidget{
  SendButton(this.createFeedback);
  final CreateFeedback createFeedback;
  final StorageService _storageService = StorageService();
FeedbackBloc _feedbackBloc = new FeedbackBloc();  

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

Future<CreateFeedbackResponse?> addFeedback(CreateFeedbackRequest request, String token)
  async {
    try {
      return await _feedbackBloc.createFeedback(request, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    FutureBuilder<String>(builder: (context, token){
      if(token.hasData){
        return  GestureDetector(
              onTap: () {
                CreateFeedbackRequest request = new CreateFeedbackRequest();
                request.content = createFeedback.context;
                request.productId = createFeedback.productId;
                request.rate = createFeedback.rating!.round();
                      addFeedback(request, token.data!);
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
       else{
      return _buildProgressIndicator();
    }
    }
   
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