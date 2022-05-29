import 'package:flutter/material.dart';

import '../../../app_properties.dart';

class AddAddressForm extends StatefulWidget {
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm>
{
  bool? checked = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Số nhà/ Địa chỉ tòa nhà'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Đường'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Thành phố/Huyện'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Tỉnh'),
            ),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: checked,
                onChanged: (value) {
                  setState(() {
                    this.checked = value;
                  });
                },
              ),
              Text('Chọn làm địa chỉ mặc định', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ))
            ],
          )
        ],
      ),
    );
  }
}