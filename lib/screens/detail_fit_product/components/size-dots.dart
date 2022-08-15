

import 'package:flutter/material.dart';
import 'package:shop_app/models/detail_product_id_model.dart';


import 'package:shop_app/models/get_detail_fit_product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SizeDots extends StatefulWidget {
  SizeDots({
    Key? key,
   required this.listSize,
   this.getQuantityRequest, this.updateTotal
  }) : super(key: key);
  List<Size>? listSize;
  GetProductDetailIdRequest? getQuantityRequest;
  final updateTotal;

  String? _sizeSelected;
  @override
  State<StatefulWidget> createState() => _SizeDotsState();
}

class _SizeDotsState extends State<SizeDots>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._sizeSelected = widget.listSize![0].sizeName;
    widget.getQuantityRequest!.sizeId = widget.listSize![0].sizeId;
    widget.getQuantityRequest!.sizeName = widget.listSize![0].sizeName;
    widget.updateTotal();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(widget._sizeSelected == null){
       widget._sizeSelected =  widget.getQuantityRequest!.sizeName;
    }

    return 
    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0)
    ,child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child:
    Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.listSize!.length,
                (index) => buildSmallSizePreview(widget.listSize![index])),
          ],)));
  }
GestureDetector buildSmallSizePreview(Size size) {
    return GestureDetector(
         onTap: () => {setState(() {
        widget._sizeSelected = size.sizeName;
        widget.getQuantityRequest!.sizeId = size.sizeId;

         widget.getQuantityRequest!.sizeName = widget._sizeSelected;
        widget.updateTotal();
      })},
       child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(widget._sizeSelected == size.sizeName ? 1 : 0)),
        ),
        child: Text(size.sizeName!),
      ),
    );
}

}