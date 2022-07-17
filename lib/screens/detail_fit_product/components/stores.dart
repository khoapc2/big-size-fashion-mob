import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/blocs/store_bloc.dart';
import 'package:shop_app/models/Store_model.dart';
import 'package:shop_app/view_model/store_view_model.dart';

class Stores extends StatefulWidget{
  const Stores({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StoresState();
}



class _StoresState extends State<Stores> {
  List<String> stores = ["Cửa hàng 1", "Cửa hàng 2","Cửa hàng 3"];
  List<Content>? storesReponse = <Content>[];
  String? selectedStore;
  int? selectStoreId; 
  StoreBloc _storeBloc = new StoreBloc();

    Future<StoreResponseModel> getAllStores() async {
    
    var result = await _storeBloc.getAllStore();
    return result;
  }
  
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var storeResponse = getAllStores();
    return 
    FutureBuilder(
      future: storeResponse,
      builder: (BuildContext context, AsyncSnapshot<StoreResponseModel> snapshot){
          if(snapshot.hasData){
            storesReponse = snapshot.data!.content;
            if(selectedStore == null){
              selectedStore = storesReponse![0].storeAddress;
            }
            return 
            Center(
      child: 
      DropdownButton<String>(
          value: selectedStore,
          items: storesReponse!.map((storeReponse) => DropdownMenuItem<String>(
        value: storeReponse.storeAddress,
        child: Text(storeReponse.storeAddress!, style: TextStyle(fontSize: 24)),)).toList(),
        onChanged: (store) => setState(() => selectedStore = store),),);
          }
          else{
            return Container();
          }
    });
    // Center(
    //   child: 
    //   DropdownButton<String>(
    //       value: selectedStore,
    //       items: stores.map((store) => DropdownMenuItem<String>(
    //     value: store,
    //     child: Text(store, style: TextStyle(fontSize: 24)),)).toList(),
    //     onChanged: (store) => setState(() => selectedStore = store),),)
    //   ;
  }
}