import 'package:flutter/material.dart';
import 'package:shop_app/screens/search_prodoct/search_product_screen.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  String? searchValue;
   SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => searchValue = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Tìm sản phẩm",
            prefixIcon: new IconButton(
  icon: new Icon(Icons.search),
  onPressed: () async { 
    {
      print(searchValue);
      var productResponseModel = await ProductViewModel.getListProductByNameSearch(searchValue);

                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchProductScreen(content: productResponseModel.content)),
                    );
                    }
   },
),
      ),
    ));
  }
}
