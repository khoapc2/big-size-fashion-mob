import 'package:flutter/material.dart';
import 'package:shop_app/blocs/product_bloc.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';
import 'package:shop_app/service/storage_service.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  Body({required this.contents});
  final String contents;
  
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final StorageService _storageService = StorageService();
  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List products = <Content>[];
  int testValue = 1;
  bool isFirstRun = true;
  ProductBloc _productBloc = new ProductBloc();
  TextEditingController receiver = TextEditingController();
  String? searchValue ="";


  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
     //call api
     var token = await getUserToken();
      var response = await getFitProductsByCategory(widget.contents, page, token!);
      setState(() {
        isLoading = false;
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

     Future<GetListFitProductByCategoryResponse> getFitProductsByCategory(String categoryName, int page, String token) async {
   
    var result = await _productBloc.getListFitProductByCategory(categoryName, page, token, searchValue!);
    return result;
  }

  Future<void> searchProductName(String categoryName, int page, String token) async {
   var response = await getFitProductsByCategory(widget.contents, page, token);
   setState(() {
     this.page = page;
     products = <Content>[];
     products.addAll(response.content!.toList());
   });
  }

Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }
   void dispose() {
    _sc.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return getproducts();
    
  }



  Widget getproducts(){
    if(isFirstRun){
      isFirstRun = false;
      return _buildProgressIndicator();
    }
    
    if(isFirstRun != true && products.length != 0){
      return
      FutureBuilder<String?>(
        future: getUserToken(),
        builder: (context, token)
      {
        if(token.hasData){
          return SingleChildScrollView(child: 
       Column(children: [
         Container(
          alignment: Alignment.center,
          height:65.0,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            onChanged: (value){
              searchValue = value;
              
            } ,
            controller: receiver,
            decoration: InputDecoration(
              prefixIcon: new IconButton(
  icon: new Icon(Icons.search),
  onPressed: () async { 
    {
     
      //var productResponseModel = await ProductViewModel.getListProductByNameSearch(searchValue);

                      searchProductName(widget.contents, 1, token.data!);
                    }
   },
),
              hintText: 'Tìm sản phẩm',
              //labelText: "Hostel name",
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding:
                  EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 10),
            ),
            style: TextStyle(
              fontFamily: "QuickSandMedium",
              fontSize: 20,
            ),
          ),
        ),
          Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: 
      
      
      ListView.builder(
        scrollDirection: Axis.vertical,
    shrinkWrap: true,
        controller: _sc,
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == products.length) {
          return _buildProgressIndicator();
        } else {
           return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            key: Key(products[index].productId.toString()),
            // direction: DismissDirection.endToStart,
            // onDismissed: (direction) {
            //   setState(() {
            //     demoCarts.removeAt(index);
            //   });
            // },
            
            child: 
            
            CartCard(content: products[index])
            ,
          ),
        );}
        } 
      ),
    )
      ],));
        }else{
          return _buildProgressIndicator();
        }
        
      }
      );
      
        
    
    }
      return Center(child: Text("Không có sản phẩm phù hợp"));
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

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
