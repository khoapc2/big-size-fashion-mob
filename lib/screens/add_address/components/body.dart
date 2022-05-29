

import 'package:flutter/material.dart';
import 'package:shop_app/screens/address/address_screen.dart';

import '../../../app_properties.dart';
import 'address_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget finishButton = MaterialButton(
                  onPressed:  () {   },
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.black,
                  child: Center(
                    child: _isLoading ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white, 
                        strokeWidth: 3,
                        color: Colors.black,
                      ),
                    ) : Text("Thêm địa chỉ", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                );
    return LayoutBuilder(
        builder: (_, viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).padding.bottom == 0
                      ? 20
                      : MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AddAddressForm(),
                  Center(child: finishButton)
                ],
              ),
            ),
          ),
        ),
      );
  }
}