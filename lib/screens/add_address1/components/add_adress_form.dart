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
            "Tỉnh/Thành phố",
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
        SizedBox(height: size.height * 0.05),
        CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: false,


                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",

                  ///Default Country
                  //defaultCountry: DefaultCountry.India,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      countryValue = value;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      stateValue = value!;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      cityValue = value!;
                    });
                  },
                ),

                ///print newly selected country state and city in Text Widget
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: Text("Print Data")),
                Text(address)
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
