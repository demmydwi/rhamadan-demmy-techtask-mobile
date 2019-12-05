import 'package:flutter/material.dart';

abstract class MyState<T extends StatefulWidget> extends State<T>{

  Future<dynamic> push(Widget newPage){
    return Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return newPage;
    }));
  }

  pop({dynamic returnVal}){
    Navigator.of(context).pop(returnVal);
  }

  Future<dynamic> present(Widget newPage){
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
      return newPage;
    }));
  }

}
