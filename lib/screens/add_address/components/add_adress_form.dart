import 'dart:ui';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shop_app/models/add_address_request_model.dart';

import '../../../blocs/customer_bloc.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../locator.dart';
import '../../../models/profile_response_model.dart';
import '../../../service/storage_service.dart';
import '../../../twilio_verify.dart';
import 'confirm.dart';

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

  TextEditingController receiver = TextEditingController();
  String receiverValue= "";
  TextEditingController phoneNumber = TextEditingController();
  String phoneNumberValue = "";
  TextEditingController addressText = TextEditingController();
  String addressTextValue= "";
  TextEditingController street = TextEditingController();
  String streetValue= "";
  TextEditingController province = TextEditingController();
  String provinceValue= "";
  final List<String?> errors = [];
  final StorageService _storageService = StorageService();
  final CustomerBloc _staffBloc = CustomerBloc();
  var _twilio = locator.get<TwilioVerify>();
  
  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  Future<ProfileResponse?> getStaffProfile(String token) async {
    return await _staffBloc.getProfile(token);
  }

  

  @override
  Widget build(BuildContext context) {
    print("Phone: "+_twilio.phone.toString());
  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if(token.hasData){
          return FutureBuilder<ProfileResponse?>(
            future: getStaffProfile(token.data!),
            builder: (context, snapshot){
            if(snapshot.hasData){
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
            "Người nhận",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height:65.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            onChanged: (value){
              receiverValue= value;
              print(receiverValue);
            } ,
            controller: receiver,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
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
            "Số điện thoại",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height:60.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
             validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } 
        return null;
      },
            onChanged: (value){
              if(value.isNotEmpty){
                removeError(error: kPhoneNumberNullError);
                phoneNumberValue= value;
              }
                return null;
            }, 
            controller: phoneNumber,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 10,
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
            "Địa chỉ",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height:65.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(

            controller: addressText,
            onChanged: (value)  {
                  addressTextValue = value;
                  print(addressTextValue);
            },
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            maxLength: 100,
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
              fontSize: 20,
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
                        print("Số điện thoại: "+phoneNumberValue);
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
        PaymentButton(receiver: receiver,address: addressText,city: cityValue,state: stateValue,phoneNumber: phoneNumber)
        // PaymentButton(receiver: "",address: addressTextValue+", "
        // +""+", "+ ""+", "+"",phoneNumber: phoneNumberValue),
      ],
    );
            }
          return _buildProgressIndicator();
          }
          );

        }
        return _buildProgressIndicator(); 
    });
    
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
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
void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  
  
}
