import 'package:flutter/material.dart';

class UserProfileEditHeader extends StatelessWidget {
  const UserProfileEditHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 20,
        ),
        Container(
          alignment: Alignment.center,
          //color: Colors.blue,
          width: 300,
          height: 50,
          child: const Text(
            "Sua thong tin ca nhan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
