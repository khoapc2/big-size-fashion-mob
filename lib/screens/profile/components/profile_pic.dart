import 'dart:io';



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shop_app/blocs/avatar_bloc.dart';
import 'package:shop_app/models/get_avata_model.dart';
import 'package:shop_app/models/update_avatar_response.model.dart';
import 'package:shop_app/service/storage_service.dart';

import '../../../custom_dialog.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProilePicState();
}

class _ProilePicState extends State<ProfilePic>{

  AvatarBloc _avatarBloc = new AvatarBloc();

  GetAvataResponse? avatar;
  
  bool isHasAvatar = false;
  final StorageService _storageService = StorageService();

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

Future<GetAvataResponse?> getAvatar(String token) async {
    var _avatar = await _avatarBloc.getAvatar(token);
    isHasAvatar = true; 
    try{
      setState(() {
      avatar = _avatar;
    });
    }catch(err){
        print(err.toString());
    }
  }

Future<void> _uploadAvatar(String token, String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImg;
    try {
      pickedImg = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920,
      );
      //final String fileName = path.basename(pickedImg!.path);
      File imgFile = File(pickedImg!.path);
      try {
        showLoading(context);
        UpdateAvatarResponse _avatar = await _avatarBloc.uploadAvatar(token, imgFile);
      
        if (_avatar.isSuccess!) {
          Navigator.pop(context);
          _showToast(context, "Thay ảnh đại diện thành công!");
          isHasAvatar = true;
          getAvatar(token);
        } else {
          showLoading(context);
          _showToast(context, "Thay ảnh đại diện thất bại!");
          Navigator.pop(context);
        }
      } catch (error) {
        if (kDebugMode) {
          print("Upload error in api: " + error.toString());
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Upload error in picker: " + e.toString());
      }
    }
  }

   showLoading(context) {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text(
                    "Đang xử lí...",
                    style: TextStyle(fontFamily: "QuicksandMedium"),
                  )
                ],
              ),
            ),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: ((context, token) {
        if(token.hasData){
           if (!isHasAvatar) {
                    getAvatar(token.data.toString());
                  }
                   if (isHasAvatar &&
                      avatar != null &&
                      avatar!.content != null) {
                        return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                                //backgroundImage:
                                //NetworkImage(avatar!.content.toString()),
                                backgroundColor:
                                    const Color.fromARGB(255, 230, 246, 252),
                                child: ClipOval(
                                  child: Image.network(
                                    avatar!.content.toString(),
                                    height: 105,
                                    width: 105,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                              right: 130,
                              bottom: -10,
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    primary: Colors.white,
                                    backgroundColor: const Color(0xFFF5F6F9),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) => CustomAlertDialog(
                                              title: "Thay ảnh đại diện",
                                              description:
                                                  "Chọn nguồn hình ảnh",
                                              camera: () {
                                                _uploadAvatar(
                                                    token.data.toString(),
                                                    "camera");
                                                Navigator.of(context).pop();
                                              },
                                              gallery: () async {
                                                _uploadAvatar(
                                                    token.data.toString(),
                                                    "galerry");
                                                Navigator.of(context).pop();
                                              },
                                            ));
                                    //_uploadAvatar(
                                    //token.data.toString(), "galerry");
                                  },
                                  child: SvgPicture.asset(
                                      "assets/icons/Camera Icon.svg"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                      }else{
                        return Shimmer.fromColors(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60)),
                      ),
                      baseColor: const Color.fromARGB(255, 230, 230, 230),
                      highlightColor: Colors.white,
                    );
                      }
            
        }
           return _buildProgressIndicator();
        
          
      })),])
      
      );
    
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

  void _showToast(BuildContext context, String content) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  
}
