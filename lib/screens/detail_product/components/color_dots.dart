import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/detail_product_model.dart';
import 'package:shop_app/models/detail_product_id_model.dart';
import 'package:string_to_hex/string_to_hex.dart';

import '../../../blocs/detail_product_bloc.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  ColorDots({
    Key? key,
   required this.listColor,
   this.getQuantityRequest,
   this.updateTotal

  }) : super(key: key);
  List<Colour>? listColor;
  final updateTotal;
  GetProductDetailIdRequest? getQuantityRequest;

  Color? _colorSelected;
  @override
  State<StatefulWidget> createState() => _ColorDotsState();
}

Future<GetProductDetailResponse> getProductDetailId(GetProductDetailIdRequest request) async {
    DetailProductBloc service = new DetailProductBloc();
    var result = await service.getProductDetailId(request);
    return result;
  }

class _ColorDotsState extends State<ColorDots>{
  @override
  void initState() {
    
    // TODO: implement initState 
    var myNiceColor = int.parse(
                            "FF" +
                                widget.listColor![0]
                                    .colourCode!
                                    .replaceAll('#', ''),
                            radix: 16);
    widget._colorSelected = Color(myNiceColor);
    widget.getQuantityRequest!.colourId = widget.listColor![0].colourId;
     widget.getQuantityRequest!.colourCode = Color(myNiceColor);
  }

  @override
  Widget build(BuildContext context) {
    if(widget._colorSelected == null){
       widget._colorSelected =  widget.getQuantityRequest!.colourCode!; 
    }
     
    // Now this is fixed and only for demo
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.listColor!.length,
            (index) => 
            // ColorDot(
            //   color: product.colors[index],
            // ),
              buildSmallColorDot(widget.listColor!.elementAt(index))
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if(widget.getQuantityRequest!.quantity > 1){
                  widget.getQuantityRequest!.quantity --;
                }
                
              });
              
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(widget.getQuantityRequest!.quantity.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                if(widget.getQuantityRequest!.quantity < 20){
                    widget.getQuantityRequest!.quantity++;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  GestureDetector buildSmallColorDot(Colour colour) {

    var myNiceColor = int.parse(
                            "FF" +
                                colour
                                    .colourCode!
                                    .replaceAll('#', ''),
                            radix: 16);
    return GestureDetector(
      onTap: () => {setState(() {
        print("cliked");
        widget._colorSelected = Color(myNiceColor);
        widget.getQuantityRequest!.colourId = colour.colourId;
        widget.getQuantityRequest!.colourCode = Color(myNiceColor);
        
        widget.getQuantityRequest!.colourCode = Color(myNiceColor);
        widget.updateTotal();
        
      })},
      child: Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: widget._colorSelected == Color(myNiceColor) ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(myNiceColor),
          shape: BoxShape.circle,
        ),
      ),
    )
    );
  }
}



