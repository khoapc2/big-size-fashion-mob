

import 'package:flutter/material.dart';
import 'package:shop_app/blocs/feedback_bloc.dart';
import 'package:shop_app/constants.dart';
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
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
      if(token.hasData){
        return  GestureDetector(
              onTap: () {
                print("content" +createFeedback.context.toString());
                
                if(createFeedback.context == null || createFeedback.context == ""){
                    showAlertDialog(context, "Nội dung không được bỏ trống");
                    
                }else{
                  
                  CreateFeedbackRequest request = new CreateFeedbackRequest();
                request.content = createFeedback.context;
                request.productId = createFeedback.productId;
                if(createFeedback.rating == null){
                  createFeedback.rating = 3;
                }
                request.rate = createFeedback.rating!.round();
                      addFeedback(request, token.data!);
                      _showToast(context);
                }
                
                    },
              child: Container(
              alignment: Alignment.center,
              height: 50.0,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: kPrimaryColor),
              padding: const EdgeInsets.all(0),
              child: Text(
                "Gửi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "QuickSandBold",
                  fontSize: 30,
                  color: Colors.white
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
        action: SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  showAlertDialog(context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Thông báo"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}