// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/userprofile/components/userprofile_header.dart';
import 'package:shop_app/screens/profile/userprofile/components/userprofile_info.dart';
import 'package:shop_app/service/storage_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final StorageService _storageService = StorageService();

  Future<String?> getUserToken() async {
    try {
      return await _storageService.readSecureData("token");
    } catch (e) {
      print("Exception: " + e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          FutureBuilder<String?>(
              future: getUserToken(),
              builder: (context, token) {
                if (token.hasData) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {});
                      },
                      child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              UserProfileHeader(
                                userToken: token.data.toString(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              UserProfileInfo(
                                userToken: token.data.toString(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )));
                }

                return const CircularProgressIndicator();
              }),

          /*
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        side: BorderSide(color: Colors.black)))),
            child: Container(
              width: 250,
              height: 60,
              alignment: Alignment.center,
              //color: kPrimaryColor,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.00),
                ),
                color: Colors.black,
              ),
              child: const Text(
                "Sua thong tin",
                style: TextStyle(
                  fontFamily: "QuickSandMedium",
                  fontSize: 30,
                ),
              ),
            ),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const UserProfileEditScreen()))
            },
          ),
          */
        ],
      ),
    );
  }
}
