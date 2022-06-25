
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/waiting_home/splash_screen.dart';
import 'package:shop_app/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {

      "text": "Chào mừng bạn đến với cửa hàng BIG SIZE",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":

          "SỨ mệnh của chúng tôi là giúp các bạn mua sắm\ntrên toàn Việt Nam",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Mua sắm nhanh chóng, dễ dàng \nHãy ở lại với chúng tôi nhé!",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),

                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      side: BorderSide(color: kPrimaryColor)))),
                      child: Container(
                        width: 250,
                        height: 60,
                        alignment: Alignment.center,
                        //color: kPrimaryColor,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.00),
                          ),
                        ),
                        child: Text(
                          "Mua sắm ngay",
                          style: TextStyle(
                            fontFamily: "QuickSand",
                            fontSize: 25,
                          ),
                        ),
                      ),
                      onPressed: () async  {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                    //     Navigator.push(
                    //     context,
                    //   MaterialPageRoute(builder: (context) => WaitngHomeScreen()),
                    // );
                      },
                    ),
                    /*
                    DefaultButton(
                      text: "Shopping now",
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),

                    */
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
