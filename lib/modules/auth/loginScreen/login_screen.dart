import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/providers/auth.dart';
import "package:flutter/material.dart";
import 'package:provider/src/provider.dart';
import './components/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
