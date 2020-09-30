import 'package:autenticacao_repositorio/autenticacao_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:smart_rdo/screens/login/login_screen.dart';
import 'package:usuario_repositorio/usuario_repositorio.dart';
import 'app/app-main.dart';


void main() {
  runApp(RdoApp(
    autenticacaoRepositorio: AuthenticationRepository(),
    usuarioRepositorio: UsuarioRepositorio(),
  ));
}


