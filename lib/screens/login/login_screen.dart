import 'package:autenticacao_repositorio/autenticacao_repositorio.dart';
import 'package:smart_rdo/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_rdo/bloc/login/login_bloc.dart';
import 'login_form.dart';
import 'login_logo.dart';

class LoginScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocProvider(
        create: (context){
          return LoginBloc(
            authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: _buildLogin(),
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topCenter,
          stops: [0, 0.5],
          colors: [Color(0xFFFFFFFF), Color(0xFF20B2AA)],
        ),
      ),
      child: ListView(
        children: <Widget>[
          LoginLogo(),
          LoginForm(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              ],
            ),
          ),
        ],
      ),
    );
  }
}
