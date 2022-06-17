import 'package:flutter/material.dart';
import 'package:shop_app/screens/add_address1/add_address_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text("[Mặc định]", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                           ),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("(+84) 01234465643", style: TextStyle(color: Colors.black, fontSize: 18),),
                              Icon(Icons.check, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230.0,
                                child: Text("123 Nguyễn Trung Trực, Q. Tân Bình, TPHCM", style: TextStyle(color: Colors.black, fontSize: 18),)
                              ),
                              Icon(Icons.location_on, color: Colors.black)
                            ],
                          ),

                        ],
                      ),

                    ]
                  ),
                  
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("(+84) 589833394", style: TextStyle(color: Colors.black, fontSize: 18),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230.0,
                                child: Text("123 Đường 265, Q.9,TP. Thủ Đức", style: TextStyle(color: Colors.black, fontSize: 18),)
                              ),
                              Icon(Icons.location_on, color: Colors.black)
                            ],
                          ),

                        ],
                      ),

                    ]
                  ),
                  
                ),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed:  () { Navigator.push(
                        context,
                     MaterialPageRoute(builder: (context) => AddddressScreen()),
                    );  },//AddAddressPage
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.black,
                  child: Center(
                    child: _isLoading ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white, 
                        strokeWidth: 3,
                        color: Colors.black,
                      ),
                    ) : Icon(Icons.add, color: Colors.white,),
                  ),
                )
            ]
          )
          )
          );
  }
}