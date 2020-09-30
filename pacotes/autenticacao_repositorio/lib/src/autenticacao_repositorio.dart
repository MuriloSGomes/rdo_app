import 'dart:async';
import 'package:meta/meta.dart';

enum AutenticacaoStatus { unknown, autenticado, naoAutenticado }

class AuthenticationRepository {
  final _controller = StreamController<AutenticacaoStatus>();

  Stream<AutenticacaoStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AutenticacaoStatus.naoAutenticado;
    yield* _controller.stream;
  }

  Future<void> logIn({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AutenticacaoStatus.autenticado),
    );
  }

  void logOut() {
    _controller.add(AutenticacaoStatus.naoAutenticado);
  }

  void dispose() => _controller.close();
}