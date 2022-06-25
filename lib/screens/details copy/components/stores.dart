import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget{
  const Stores({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  List<String> stores = ["Cửa hàng 1", "Cửa hàng 2","Cửa hàng 3"];
  String? selectedStore = "Cửa hàng 1"; 
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: 
      DropdownButton<String>(
          value: selectedStore,
          items: stores.map((store) => DropdownMenuItem<String>(
        value: store,
        child: Text(store, style: TextStyle(fontSize: 24)),)).toList(),
        onChanged: (store) => setState(() => selectedStore = store),),)
      ;
  }
}