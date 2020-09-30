import 'dart:async';
import 'package:autenticacao_repositorio/autenticacao_repositorio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:usuario_repositorio/usuario_repositorio.dart';
part 'autenticacao_event.dart';
part 'autenticacao_state.dart';

class AuthenticationBloc
    extends Bloc<AutenticacaoEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UsuarioRepositorio usuarioRepositorio,
  })  : assert(authenticationRepository != null),
        assert(usuarioRepositorio != null),
        _authenticationRepository = authenticationRepository,
        _userRepository = usuarioRepositorio,
        super(const AuthenticationState.unknown()) {
        _authenticationStatusSubscription = _authenticationRepository.status.listen(
          (status) => add(AutenticacaoStatusTrocado(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UsuarioRepositorio _userRepository;
  StreamSubscription<AutenticacaoStatus> _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AutenticacaoEvent event,
      ) async* {
    if (event is AutenticacaoStatusTrocado) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      _authenticationRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
      AutenticacaoStatusTrocado event,
      ) async {
    switch (event.status) {
      case AutenticacaoStatus.naoAutenticado:
        return const AuthenticationState.naoAutenticado();
      case AutenticacaoStatus.autenticado:
        final user = await _tryGetUser();
        return user != null
            ? AuthenticationState.autenticado(user)
            : const AuthenticationState.naoAutenticado();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<Usuario> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } on Exception {
      return null;
    }
  }
}