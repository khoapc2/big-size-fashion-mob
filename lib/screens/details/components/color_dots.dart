import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  ColorDots({
    Key? key,
    required this.product,
   
  }) : super(key: key);

  final Product product;
  Color? _colorSelected;
  int _quantity = 1 ;
  @override
  State<StatefulWidget> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots>{
  @override
  void initState() {
    // TODO: implement initState
     widget._colorSelected = widget.product.colors.first;  
  }
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => 
            // ColorDot(
            //   color: product.colors[index],
            // ),
              buildSmallColorDot(widget.product.colors[index])
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if(widget._quantity > 1){
                  widget._quantity --;
                }
                
              });
              
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(widget._quantity.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                widget._quantity ++;
              });
            },
          ),
        ],
      ),
    );
  }

  GestureDetector buildSmallColorDot(Color color) {
    return GestureDetector(
      onTap: () => {setState(() {
        widget._colorSelected = color;
      })},
      child: Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: widget._colorSelected == color ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    )
    );
  }
}



