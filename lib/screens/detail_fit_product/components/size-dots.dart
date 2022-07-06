

import 'package:flutter/material.dart';
import 'package:shop_app/models/detail_product_id_model.dart';


import 'package:shop_app/models/get_detail_fit_product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SizeDots extends StatefulWidget {
  SizeDots({
    Key? key,
   required this.listSize,
   this.getQuantityRequest
  }) : super(key: key);
  List<Size>? listSize;
  GetProductDetailIdRequest? getQuantityRequest;

  String? _sizeSelected;
  @override
  State<StatefulWidget> createState() => _SizeDotsState();
}

class _SizeDotsState extends State<SizeDots>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.listSize!.length,
                (index) => buildSmallSizePreview(widget.listSize![index])),
          ],);
  }
GestureDetector buildSmallSizePreview(Size size) {
    return GestureDetector(
         onTap: () => {setState(() {
        widget._sizeSelected = size.sizeName;
        widget.getQuantityRequest!.sizeId = size.sizeId;
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