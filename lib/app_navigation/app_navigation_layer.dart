import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation{
  push(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}