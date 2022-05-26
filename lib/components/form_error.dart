import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
<<<<<<< HEAD
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
=======
          height: getProportionateScreenWidth(24),
          width: getProportionateScreenWidth(24),
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
<<<<<<< HEAD
        Text(error),
=======
        Text(
          error,
          style: TextStyle(
            fontFamily: "QuickSandMedium",
            fontSize: 15,
          ),
        ),
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
      ],
    );
  }
}
