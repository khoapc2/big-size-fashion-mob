// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// ignore: must_be_immutable
class EditProfileForm extends StatefulWidget {
  String name = "";
  String dob = "";
  String phone = "";
  String email = "";

  EditProfileForm(
      {required this.name,
      required this.dob,
      required this.phone,
      required this.email});

  _EditProfile createState() =>
      _EditProfile(name: name, dob: dob, phone: phone, email: email);
}

class _EditProfile extends State<EditProfileForm> {
  String name = "";
  String dob = "";
  String phone = "";
  String email = "";

  _EditProfile(
      {required this.name,
      required this.dob,
      required this.phone,
      required this.email});

  TextEditingController nameP = TextEditingController();
  TextEditingController emailP = TextEditingController();
  TextEditingController birthDay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameP.text = name;
    emailP.text = email;
    birthDay.text = dob;

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
            phone,
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
            "NAME",
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 25,
              color: Color(0xFF0085C3),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: nameP,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
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
            "EMAIL",
            style: TextStyle(
                fontFamily: "QuickSandBold",
                fontSize: 25,
                color: Color(0xFF0085C3)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: emailP,
            decoration: InputDecoration(
              //labelText: "Hostel address",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
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
            "BIRTH DAY",
            style: TextStyle(
                fontFamily: "QuickSandBold",
                fontSize: 25,
                color: Color(0xFF0085C3)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: birthDay,
            decoration: InputDecoration(
              //labelText: "Room amount",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
            ),
            style: TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
            enabled: false,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 20),
          child: TextButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1950, 1, 1),
                  maxTime: DateTime(2022, 12, 31),
                  theme: DatePickerTheme(
                    headerColor: Color(0x1000ADFF),
                    backgroundColor: Color(0xFFFFFFFF),
                    itemStyle: TextStyle(
                      color: Color(0xFF00ADFF),
                      fontFamily: "QuickSandBold",
                      fontSize: 20,
                    ),
                    doneStyle: TextStyle(
                      color: Color(0xFF0085C3),
                      fontSize: 20,
                      fontFamily: "QuickSandBold",
                    ),
                    cancelStyle: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20,
                      fontFamily: "QuickSandBold",
                    ),
                  ),
                  onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  },
                  onConfirm: (date) {
                    print('confirm $date');
                    String bd = "";
                    if ((date.day >= 10) && (date.month >= 10))
                      bd = date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    if ((date.day < 10) && (date.month >= 10))
                      bd = "0" +
                          date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    if ((date.day >= 10) && (date.month < 10))
                      bd = date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    if ((date.day < 10) && (date.month < 10))
                      bd = "0" +
                          date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    print(bd);
                    birthDay.text = bd;
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.vi,
                );
              },
              child: Text(
                'Chon ngay',
                style: TextStyle(
                  color: Color(0xFF00ADFF),
                  fontFamily: "QuickSandBold",
                  fontSize: 25,
                ),
              )),
        ),
        SizedBox(height: size.height * 0.05),
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
