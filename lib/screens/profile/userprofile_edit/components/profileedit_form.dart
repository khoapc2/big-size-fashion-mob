// ignore_for_file: deprecated_member_use, avoid_print, unnecessary_const



import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shop_app/blocs/customer_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/update_profile_request_model.dart';
import 'package:shop_app/models/update_profile_response_model.dart';
import 'package:shop_app/screens/profile/userprofile/userprofile_screen.dart';

// ignore: must_be_immutable
class EditProfileForm extends StatefulWidget {
  final String userToken;
  String name = "";
  String dob = "";
  String height = "";
  String weight = "";
String gender = "";
  String email = "";

  EditProfileForm(
      {Key? key,
      required this.name,
      required this.dob,
      required this.height,
      required this.weight,
      required this.gender,
      required this.email,
      required this.userToken})
      : super(key: key);

  @override
  _EditProfile createState() =>
      // ignore: no_logic_in_create_state
      _EditProfile(
          userToken: userToken,
          name: name,
          dob: dob,
          email: email,
          gender: gender,
          height: height,
          weight: weight
           );
}

class _EditProfile extends State<EditProfileForm> {
  final CustomerBloc _customerBloc = CustomerBloc();
  final String userToken;
  String name = "";
  String dob = "";
  String height = "";
  String weight = "";
  String gender = "";
  String email = "";
  String genderSelected = "";

  _EditProfile(
      {required this.name,
      required this.dob,
      required this.height,
      required this.weight,
      required this.gender,
      required this.email,
      required this.userToken});

  TextEditingController nameP = TextEditingController();
  TextEditingController emailP = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  TextEditingController heightP = TextEditingController();
  TextEditingController weightP = TextEditingController();
  TextEditingController genderP = TextEditingController();

  @override
  void initState() {
    super.initState();
    genderSelected = gender;
  }

  Future<UpdateProfileResponseModel?> updateProfile(UpdateProfileRequestModel request, String token)
  async {
    try {
      return await _customerBloc.updateProfile(request, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    nameP.text = name;
    emailP.text = email;
    if(dob == "null"){
      dob = "";
    }
    birthDay.text = dob;
    genderP.text = gender;
    
    heightP.text = height;
    weightP.text = weight;
    var items = [   
    'Nam',
    'Nữ',
  ];

    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(height: size.height * 0.001),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "Họ và tên",
            style: TextStyle(
              fontFamily: "QuicksandBold",
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: TextField(
            controller: nameP,
            decoration: InputDecoration(
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              focusColor: Colors.white,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            maxLength: 50,
            style: const TextStyle(
              fontFamily: "QuicksandMedium",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.002),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "EMAIL",
            style: TextStyle(
                fontFamily: "QuicksandBold",
                fontSize: 20,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: TextField(
            controller: emailP,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            maxLength: 100,
            style: const TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.002),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "Giới tính",
            style: TextStyle(
                fontFamily: "QuicksandBold",
                fontSize: 20,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          width: 327,
          child: InputDecorator(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            child: Container(width: 50,
          child:  
          
          DropdownButton<String>(
      value: genderSelected,
      items: items.map((String items) {
      
        return DropdownMenuItem(
          value: items,
          child: Text(items));
    } ).toList(), onChanged: (String? newValue) {
      setState(() {
        genderSelected = newValue!;
        print("genderSelected: "+genderSelected);
      });
    })
        ),
            ),
        ),
        
        SizedBox(height: size.height * 0.03),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "Chiều cao (cm)",
            style: TextStyle(
                fontFamily: "QuicksandBold",
                fontSize: 20,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: heightP,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            maxLength: 3,
            style: const TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.002),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "Cân nặng (kg)",
            style: TextStyle(
                fontFamily: "QuicksandBold",
                fontSize: 20,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: weightP,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            maxLength: 3,
            style: const TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.002),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.blue,
          child: const Text(
            "Sinh nhật",
            style: TextStyle(
                fontFamily: "QuicksandBold",
                fontSize: 20,
                color: Color(0xFF000000)),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: TextField(
            controller: birthDay,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            style: const TextStyle(
              fontFamily: "QuicksandMedium",
              fontSize: 20,
            ),
            //enabled: false,
            readOnly: true,
            focusNode: FocusNode(),
            enableInteractiveSelection: false,
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1950, 1, 1),
                maxTime: DateTime(2022, 12, 31),
                theme: const DatePickerTheme(
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
                  if ((date.day >= 10) && (date.month >= 10)) {
                    bd = date.day.toString() +
                        "/" +
                        date.month.toString() +
                        "/" +
                        date.year.toString();
                  }
                  if ((date.day < 10) && (date.month >= 10)) {
                    bd = "0" +
                        date.day.toString() +
                        "/" +
                        date.month.toString() +
                        "/" +
                        date.year.toString();
                  }
                  if ((date.day >= 10) && (date.month < 10)) {
                    bd = date.day.toString() +
                        "/0" +
                        date.month.toString() +
                        "/" +
                        date.year.toString();
                  }
                  if ((date.day < 10) && (date.month < 10)) {
                    bd = "0" +
                        date.day.toString() +
                        "/0" +
                        date.month.toString() +
                        "/" +
                        date.year.toString();
                  }
                  print(bd);
                  birthDay.text = bd;
                },
                currentTime: DateTime.now(),
                locale: LocaleType.vi,
              );
            },
          ),
        ),
        /*
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1950, 1, 1),
                  maxTime: DateTime(2022, 12, 31),
                  theme: const DatePickerTheme(
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
                    if ((date.day >= 10) && (date.month >= 10)) {
                      bd = date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day < 10) && (date.month >= 10)) {
                      bd = "0" +
                          date.day.toString() +
                          "/" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day >= 10) && (date.month < 10)) {
                      bd = date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    if ((date.day < 10) && (date.month < 10)) {
                      bd = "0" +
                          date.day.toString() +
                          "/0" +
                          date.month.toString() +
                          "/" +
                          date.year.toString();
                    }
                    print(bd);
                    birthDay.text = bd;
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.vi,
                );
              },
              child: const Text(
                'Chon ngay',
                style: TextStyle(
                  color: Color(0xFF00ADFF),
                  fontFamily: "QuickSandBold",
                  fontSize: 25,
                ),
              )),
        ),
        */
        SizedBox(height: size.height * 0.05),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: RaisedButton(
            onPressed: () async {
              String errors = "";
              if(nameP.text == ""){
                  errors = "Vui lòng nhập tên\n";
              }
              if(emailP.text == ""){
                errors +="Vui lòng nhập email\n";
              }
              if(heightP.text == ""){
                errors += "Vui lòng nhập chiêu cao\n";
              }
              if(weightP.text == ""){
                errors += "Vui lòng nhập cân nặng\n";
              }
              if(errors == ""){
              UpdateProfileRequestModel content = UpdateProfileRequestModel(
                  fullname: nameP.text,
                  email: emailP.text,
                  birthday: birthDay.text == ""?"null": birthDay.text,
                  gender: genderSelected == "Nam" ? true: false,
                  heigth: int.parse(heightP.text),
                  weigth: int.parse(weightP.text),
                  
                );
              var profileUpdateResponse = await updateProfile(content, userToken);

              if(profileUpdateResponse != null){
                var nav = Navigator.of(context);
                nav.pop();
                nav.pop();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const UserProfileScreen()));  
              }
              
              } else {
                showAlertDialog(context,
                    errors);
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: kPrimaryColor,
                  ),
              padding: const EdgeInsets.all(0),
              
              child: const Text(
                "XÁC NHẬN",
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
    return const OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(const Radius.circular(10)),
        borderSide: const BorderSide(
          color: Color(0xFF00ADFF),
          width: 2,
        ));
  }

  showAlertDialog(context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Thông báo"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
