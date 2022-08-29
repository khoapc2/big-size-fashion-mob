import 'package:flutter/material.dart';
//import 'package:shop_app/components/default_button.dart';

import 'add_adress_form.dart';
import 'add_adress_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          AddAddressEditHeader(),
          SizedBox(
            height: 2,
          ),
          AddAdressForm(),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
