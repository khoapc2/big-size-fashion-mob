

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateFeedbackButton extends StatelessWidget{
  UpdateFeedbackButton();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  GestureDetector(
              onTap: () {
                    //   Navigator.push(
                    //     context,
                    //   MaterialPageRoute(builder: (context) => RatingScreen()),
                    // );
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
                "Cập nhật",
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
}