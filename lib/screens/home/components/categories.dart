import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/search_product_by_category/search_product_by_category_screen.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/shirt.svg", "text": "Sơ mi"},
      {"icon": "assets/icons/TS5.svg", "text": "Áo thun"},
      {"icon": "assets/icons/trouser.svg", "text": "Quần dài"},
      {"icon": "assets/icons/short pant.svg", "text": "Quần short"},
      {"icon": "assets/icons/skirt.svg", "text": "Đầm"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () async {
              var productResponseModel = await ProductViewModel.getProductsByCategory(categories[index]["text"]);
              Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchProductsByCategoryScreen(content: productResponseModel.content)),
                    );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
