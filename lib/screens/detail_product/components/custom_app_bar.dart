import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/blocs/feedback_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/rating_response_model.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/feedback/feedback_screen.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:shop_app/view_model/feedback_view_model.dart';

import '../../../size_config.dart';
import '../details_screen.dart';

class CustomAppBar extends StatelessWidget {
  final InputForViewingFeedback? inputForViewingFeedback;
  FeedbackBloc _feedbackBloc = new FeedbackBloc();
  late Future<RatingResponse> _ratingResponse;

  CustomAppBar({required this.inputForViewingFeedback});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
 Future<RatingResponse> getRating(int productId) async {
    
    var result = await _feedbackBloc.getRating(productId);
    return result;
  }
  @override
  Widget build(BuildContext context) {
     _ratingResponse = getRating(inputForViewingFeedback!.productId!);
    return 
    FutureBuilder(
      future: _ratingResponse,
      builder: (BuildContext context, AsyncSnapshot<RatingResponse> snapshot){
          if(snapshot.hasData){
            inputForViewingFeedback!.averageRating = snapshot.data!.content;
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
            IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
            GestureDetector(
              onTap: () => Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ViewFeedback(productId: inputForViewingFeedback!.productId, urlImage: inputForViewingFeedback!.urlImage,avarageRating: inputForViewingFeedback!.averageRating)),
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
