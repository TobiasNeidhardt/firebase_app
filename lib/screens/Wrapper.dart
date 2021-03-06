import 'package:firebase_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserLocal>(context);
    if(user == null){
      //  return either Home or Authenticate Widget
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
