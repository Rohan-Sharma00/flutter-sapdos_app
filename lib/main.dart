import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => LoginPageBloc(),
      child: HomeScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
