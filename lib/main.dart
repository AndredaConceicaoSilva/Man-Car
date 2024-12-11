import 'package:flutter/material.dart';
import 'package:mancar/user_form.dart';
import 'package:mancar/user_provider.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title:'Crud App',
        home:UserForm(),
        routes: {
          "/create":(_) => UserForm(),
          //lista de usuario
        },
        ),
      );
  }
}
      
