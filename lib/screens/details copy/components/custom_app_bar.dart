import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/rating_response_model.dart';
import 'package:shop_app/screens/feedback/feedback_screen.dart';
import 'package:shop_app/view_model/feedback_view_model.dart';

import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  final int? productId;

  CustomAppBar({required this.productId, });

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    var rating = FeedbackViewModel.getRating(productId!);
    return 
    FutureBuilder(
      future: rating,
      builder: (BuildContext context, AsyncSnapshot<RatingResponse> snapshot){
          if(snapshot.hasData){
            return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ViewFeedback()),
                    ),
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    snapshot.data!.content.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                ],
              ),
            )
            )
          ],
        ),
      ),
    );
          }
          else{
            return Container();
          }
      });
    
  }
}
