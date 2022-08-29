// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:shop_app/blocs/register_account_bloc.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

// ignore: must_be_immutable
class EditProfileForm extends StatefulWidget {
  String phone = "";
  String email = "";

  EditProfileForm(
      {
      required this.phone,
      required this.email});

  _EditProfile createState() =>
      _EditProfile(phone: phone, email: email);
}

class _EditProfile extends State<EditProfileForm> {
  String phone = "";
  String email = "";

  _EditProfile(
      {
      required this.phone,
      required this.email});

  TextEditingController nameP = TextEditingController();
  TextEditingController heighP = TextEditingController();
  TextEditingController weightP = TextEditingController();
  TextEditingController emailP = TextEditingController();
  TextEditingController genderP = TextEditingController();

Future<RegisterAccountResponse?> getRegisterResponse(RegisterAccountRequest registerRequestModel)
  async {
    RegisterAccountResponse? response;
    RegisterAccountBloc _registerAccoutBloc = new RegisterAccountBloc();
    try {
      response = await _registerAccoutBloc.registerAccount(registerRequestModel);
    } catch (Exception) {
      print("Bị lỗi nè:"+Exception.toString());
      response = null;
    }
    return response;
  }
  @override
  Widget build(BuildContext context) {
    emailP.text = email;

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
            "Tên",
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
          height: 70.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: nameP,
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
          height: 70.0,
          margin: EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: Text(
            "Chiều cao (cm)",
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
          height: 70.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
      keyboardType: TextInputType.number,
            controller: heighP,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 3,
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
            "Cân nặng (kg)",
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
          height: 70.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
      keyboardType: TextInputType.number,
            controller: weightP,
            decoration: InputDecoration(
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 3,
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
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height: 70.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: emailP,
            decoration: InputDecoration(
              //labelText: "Hostel address",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 100,
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
            "Giới tính",
            style: TextStyle(
                fontFamily: "QuickSandBold",
                fontSize: 25,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          height: 70.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: genderP,
            decoration: InputDecoration(
              //labelText: "Hostel address",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 10),
            ),
            maxLength: 100,
            style: TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
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
            child: 
            GestureDetector(
              onTap: () async {
               var registerRequestVM = RegisterAccountRequest(
                  email: emailP.text,
                  fullname: nameP.text,
                  gender: genderP.text,
                  heigth: int.parse(heighP.text),
                  phoneNumber: phone,
                  weigth: int.parse(weightP.text),
                  );
                var response = await getRegisterResponse(registerRequestVM);
                var token = response!.content!.token;

                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              } ,
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
            )
            ,
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
