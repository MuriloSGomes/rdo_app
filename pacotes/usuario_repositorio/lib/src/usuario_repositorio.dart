import 'dart:async';
import 'models/models.dart';

class UsuarioRepositorio {
  Usuario _usuario;

  Future<Usuario> getUser() async {
    if (_usuario != null) return _usuario;
  }
}