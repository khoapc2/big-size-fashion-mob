import 'package:flutter/material.dart';
import 'package:shop_app/models/get_fit_product_by_category_model.dart';
import 'package:shop_app/screens/search_fit_products_by_category/search_fit_product_by_category_screen.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FitProductByCategoryResponse = ProductViewModel.getFitProductByCategory();
    return FutureBuilder(
      future: FitProductByCategoryResponse,
      builder: (BuildContext context, AsyncSnapshot<GetFitProductByCategoryResponse> snapshot){
        if(snapshot.hasData){
      return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Sản phẩm phù hợp",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
               SpecialOfferCard(
                image: "assets/images/dam v2.jpg",
                category: "Sơ mi",
                numOfBrands: snapshot.data!.content!.firstWhere((category) => category.categoryId == 5,orElse: () => new Content(quantityFitProduct: 0)).quantityFitProduct!,
                press: () async {
                  //var listProductResponse = await ProductViewModel.getFitProductsByCategory("Sơ mi");
                  Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchFitProductsByCategoryScreen(category: "Sơ mi")),
                    );
                },
              ),
               SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Áo thun",
                numOfBrands: snapshot.data!.content!.firstWhere((category) => category.categoryId == 6,orElse: () => new Content(quantityFitProduct: 0)).quantityFitProduct!,
                press: () async {
                  Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchFitProductsByCategoryScreen(category: "Áo thun")),
                    );
                },
              ),
              SpecialOfferCard(
                image: "assets/images/short v2.jpg",
                category: "Quần dài",
                numOfBrands: snapshot.data!.content!.firstWhere((category) => category.categoryId == 7,orElse: () => new Content(quantityFitProduct: 0)).quantityFitProduct!,
                press: () async {
                  //var listProductResponse = await ProductViewModel.getFitProductsByCategory("Quần dài");
                  Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchFitProductsByCategoryScreen(category: "Quần dài")),
                    );
                },
              ),
              
              SpecialOfferCard(
                
                image: "assets/images/quan dai v2.jpg",
                category: "Quần short",
                numOfBrands: snapshot.data!.content!.firstWhere((category) => category.categoryId == 8,orElse: () => new Content(quantityFitProduct: 0)).quantityFitProduct!,
                press: () async {
                 // var listProductResponse = await ProductViewModel.getFitProductsByCategory("Quần short");
                  Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchFitProductsByCategoryScreen(category: "Quần short")),
                    );
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Ao thun v2.jpg",
                category: "Đầm",
                numOfBrands: snapshot.data!.content!.firstWhere((category) => category.categoryId == 9,orElse: () => new Content(quantityFitProduct: 0)).quantityFitProduct!,
                press: () async {
                 // var listProductResponse = await ProductViewModel.getFitProductsByCategory("Đầm");
                  Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SearchFitProductsByCategoryScreen(category: "Đầm")),
                    );
                },
              ),
             
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
    
        }
        else{
      return Container();
    }
    });
    
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Sản phẩm")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
