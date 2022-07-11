import 'package:flutter/material.dart';
import 'package:shop_app/screens/rating/components/body.dart';

class Comment extends StatelessWidget {
  Comment(this.createFeedback);
  final CreateFeedback createFeedback;

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.only(left: 10, top: 15),
        child: Center(
          // padding: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
          //   alignment: Alignment.centerLeft,
            child: Column(
          children: [
            // Text('Cùng nhau chia sẻ trải nghiệm đặt sân tại đây với mọi người nhé',
            //   style: TextStyle(fontSize: 10.0),
            //   textAlign: TextAlign.left,
            //
            //   ),
            // Text('Tối đa 100 ký tự',
            //   style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.right,
            // ),
            TextField(
              onChanged: (value) {
                createFeedback.setContext(value);
              },
              decoration: InputDecoration(
                hintText: 'Cùng nhau chia sẻ trải nghiệm mua hàng tại big size shop',
                hintStyle: TextStyle(
                  color: Colors.grey, // <-- Change this
                  fontSize: 10.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              border: OutlineInputBorder(),
                suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.camera_alt),
        ),
              ),
              maxLines: 10,
              maxLength: 500,
            )
            ],
          )
        ),
    );

  }

  }