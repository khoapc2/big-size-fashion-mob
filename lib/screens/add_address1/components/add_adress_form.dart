// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// ignore: must_be_immutable
class AddAdressForm extends StatefulWidget {

  AddAdressForm();

  _AddAddress createState() =>
      _AddAddress();
}

class _AddAddress extends State<AddAdressForm> {

  _AddAddress();
   String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  TextEditingController addressText = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController province = TextEditingController();

  @override
  Widget build(BuildContext context) {
  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 50.0,
          width: size.width * 10,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
              ),
              gradient: new LinearGradient(colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255)
              ])),
          padding: const EdgeInsets.all(0),
          child: Text(
            "",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 30,
              color: Color(0xFF00ADFF),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: Text(
            "Số nhà",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 25,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height:60.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: addressText,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 50,
            style: TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
         Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: Text(
            "Đường",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 25,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height:60.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: street,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 50,
            style: TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
         Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: Text(
            "Vị trí",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 25,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.only(left: 20, right: 20),
        //   child: TextField(
        //     controller: nameP,
        //     decoration: InputDecoration(
        //       //labelText: "Hostel name",
        //       border: myinputborder(),
        //       enabledBorder: myinputborder(),
        //       focusedBorder: myfocusborder(),
        //       contentPadding:
        //           EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
        //     ),
        //     maxLength: 50,
        //     style: TextStyle(
        //       fontFamily: "QuickSandMedium",
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        // SizedBox(height: size.height * 0.05),
        // Container(
        //   alignment: Alignment.centerLeft,
        //   margin: EdgeInsets.only(left: 20),
        //   //color: Colors.blue,
        //   child: Text(
        //     "Quận/ Huyện",
        //     style: TextStyle(
        //       fontFamily: "QuickSandBold",
        //       fontSize: 25,
        //       color: Color(0xFF000000),
        //     ),
        //   ),
        // ),
        // SizedBox(height: size.height * 0.01),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.only(left: 20, right: 20),
        //   child: TextField(
        //     controller: nameP,
        //     decoration: InputDecoration(
        //       //labelText: "Hostel name",
        //       border: myinputborder(),
        //       enabledBorder: myinputborder(),
        //       focusedBorder: myfocusborder(),
        //       contentPadding:
        //           EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
        //     ),
        //     maxLength: 50,
        //     style: TextStyle(
        //       fontFamily: "QuickSandMedium",
        //       fontSize: 20,
        //     ),
        //   ),
        // ),

        Container(
          margin: EdgeInsets.symmetric(horizontal:14.0, vertical: 0.0),
          child: CSCPicker(
                    showStates: true,
                    showCities: true,
                    disableCountry: true,
                    defaultCountry: DefaultCountry.Vietnam,
                    flagState: CountryFlag.DISABLE,
                    countryDropdownLabel: "Nước",
                    stateDropdownLabel: "Tỉnh/ Thành phố",
                    cityDropdownLabel: "Quận/Huyện",
                    selectedItemStyle: const TextStyle(
                      fontFamily: "QuickSandBold",
                      fontSize: 15,
                      color: Color(0xFF00ADFF),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      //color: Colors.black,
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 2,
                        color: const Color(0xFF00ADFF),
                      ),
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      //color: Colors.black,
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    onCountryChanged: (value) {
                      setState(() {
                        //store value in country variable
                        countryValue = value;
                      });
                    },
                    //triggers once state selected in dropdown
                    onStateChanged: (value) {
                      setState(() {
                        //store value in state variable
                        if (value != null) stateValue = value;
                      });
                    },
                    //triggers once city selected in dropdown
                    onCityChanged: (value) {
                      setState(() {
                        //store value in city variable
                        if (value != null) cityValue = value;
                      });
                    },
                  ),
        ),
        
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: RaisedButton(
            onPressed: () => {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: new LinearGradient(colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(150, 0, 0, 0)
                  ])),
              padding: const EdgeInsets.all(0),
              child: Text(
                "XAC NHAN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "QuickSandBold",
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05)
      ],
    );
  }

  OutlineInputBorder myinputborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color(0xFF00ADFF),
          width: 2,
        ));
  }

  
}