// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/blocs/customer_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/profile_response_model.dart';
import 'package:shop_app/resource/styles_manager.dart';
import 'package:shop_app/size_config.dart';

class UserProfileHeader extends StatefulWidget {
  final String userToken;
  const UserProfileHeader({
    Key? key,
    required this.userToken,
  }) : super(key: key);

  @override
  _UserProfileHeader createState() => _UserProfileHeader(userToken);
}

class _UserProfileHeader extends State<UserProfileHeader> {
  final String userToken;
  final CustomerBloc _staffBloc = CustomerBloc();

  _UserProfileHeader(this.userToken);

  Future<ProfileResponse?> getCustomerProfile(String token) async {
    return await _staffBloc.getProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<ProfileResponse?>(
            future: getCustomerProfile(userToken),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: StyleManager.shadow,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width - 40
                  ,
                  height: 50,
                  child: Text(
                    snapshot.data!.content!.fullname.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "QuickSandBold",
                      fontSize: 30,
                      color: kPrimaryColor,
                    ),
                  ),
                );
              }

              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: StyleManager.shadow,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                //color: Colors.white,
                width: 400,
                height: 50,
                child: Shimmer.fromColors(
                  baseColor: Colors.black.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: const Text(
                    "Tên của bạn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "QuickSandBold",
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
