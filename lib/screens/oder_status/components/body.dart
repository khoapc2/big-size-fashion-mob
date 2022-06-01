import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app_properties.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentStep = 0;
  final List<Location> locations = [
    Location('Đã xác thực', DateTime(2019, 6, 5, 5, 23, 4),
        "assets/icons/approvement.png",
        showHour: false, isHere: false, passed: true),
    Location('Đã đóng gói', DateTime(2019, 6, 6, 5, 23, 4),
        "assets/icons/package.png",
        showHour: false, isHere: true, passed: false),
    Location(
      'Dư kiến giao cho bên vận chuyển',
      DateTime(2019, 6, 9, 5, 23, 4),
      "assets/icons/truck.png",
      showHour: false,
      isHere: false,
    ),
    Location(
      'Dự kiến nhận hàng',
      DateTime(2019, 6, 10, 5, 23, 4),
      "assets/icons/receivement.jpg",
      showHour: false,
      isHere: false,
    ),
  ];
  String selectedProduct = 'Đôi dày hồng cánh sen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constraints) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: <String>[
                    'Đôi dày hồng cánh sen',
                    'Áo khoác nike',
                    'Giầy đá bóng',
                    'Tất lưới đẹp màu đen',
                    'Nón ông địa',
                    'Quần jean ông đia'
                  ].map((val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Container(
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                val,
                                maxLines: 2,
                                semanticsLabel: '...',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProduct = newValue as String;
                    });
                  },
                  value: selectedProduct,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                ),
              ),
            ),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight - 48,
                ),
                child: Theme(
                  data:
                      ThemeData(primaryColor: yellow, fontFamily: 'Montserrat'),
                  child: Stepper(
                    onStepCancel: () {
                      if (currentStep != 0) {
                        setState(() {
                          currentStep--;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (currentStep != 3) {
                        setState(() {
                          setState(() {
                            currentStep++;
                          });
                        });
                      }
                    },
                    controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                      return Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          children: [
                            currentStep == 3 ?
                            Container():
                            Expanded(
                                child: ElevatedButton(
                                    child: Text('Tiếp'),
                                    onPressed: onStepContinue))
                                    ,
                            const SizedBox(width: 12),
                            currentStep == 0 ?
                            Container():
                            Expanded(
                              child: ElevatedButton(
                                child: Text('Trở lại'),
                                onPressed: onStepCancel,
                              ),)
                          ],
                        ),
                      );
                    },
                    onStepTapped: (index) => {
                      setState(() {
                        currentStep = index;
                      })
                    },
//                          physics: NeverScrollableScrollPhysics(),
                    steps: [
                      ...locations
                          .map(
                            (location) => Step(
                              isActive: location.isHere || location.passed,
                              title: Text(location.city),
                              subtitle: Text(location.getDate()),
                              content: Align(
                                child:Container(child: Image.asset(location.iconPath),
                                width: 70.0,),
                                alignment: Alignment.centerLeft,
                              ),
                              state: location.passed
                                  ? StepState.complete
                                  : location.isHere
                                      ? StepState.editing
                                      : StepState.indexed,
                            ),
                          )
                          .toList()
                    ],
                    currentStep: currentStep,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Location {
  String city;
  DateTime date;
  bool showHour;
  bool isHere;
  String iconPath;
  bool passed;

  Location(this.city, this.date, this.iconPath,
      {this.showHour = false, this.isHere = false, this.passed = false});

  String getDate() {
    if (showHour) {
      return DateFormat("K:mm aaa, d MMMM y").format(date);
    } else {
      return DateFormat('d MMMM y').format(date);
    }
  }
}
