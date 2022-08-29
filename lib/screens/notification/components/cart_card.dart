import 'package:flutter/material.dart';

import '../../../models/notification_response_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content? content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    child: Card(
                        color: Color(0xFFF5F6F9),
                        child: Column(
                          children: [
                            ListTile(
                                title: Text("Tiêu đề: " +
                                    content!.title!),
                                //leading: Text("Ngày đặt: "+snapshot.data!.content![i].createDate!),
                                subtitle: Text('Thông báo: ' +
                                    content!.message!),
                            ),
                            Text("Ngày tạo: " + content!.createDate!)
                          ],
                        )),
                    onTap: ()
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(orders[i])));
                        {}
                  );
  }

  void _onSearchButtonPressed() {
    print("icon clicked");
  }

}
