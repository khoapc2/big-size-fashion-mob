
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/view_voucher/view_voucher_screen.dart';

import '../../../size_config.dart';

class ImageForHome extends StatelessWidget {
   const ImageForHome({
    Key? key,
  }) : super(key: key);
  final urlImages = const [
    'assets/images/plus-dresses-copy.png',
    'assets/images/maxresdefault.jpg',
    'assets/images/big_size_image_banner.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () { Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ViewVoucherScreen()),
                    );}, 
      child: Container(
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      // padding: EdgeInsets.symmetric(
      //   horizontal: getProportionateScreenWidth(20),
      //   vertical: getProportionateScreenWidth(15),
      // ),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20),
        border :Border.all(
                    color: kPrimaryColor,
                    width: 1,
                  )
      ),
      child: CarouselSlider.builder(
        itemCount: urlImages.length, 
        itemBuilder: (context, index, realIndex){
          final urlImage = urlImages[index];
          return buildImage(urlImage, index);
        },
        options: CarouselOptions(
          height: 150,
          autoPlay: true
        )),
        )
    );
  }

  Widget buildImage(String urlImage, int index) => 
  Container(
    width: 300,
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: Image.asset(urlImage, fit: BoxFit.fill),
  );
}
