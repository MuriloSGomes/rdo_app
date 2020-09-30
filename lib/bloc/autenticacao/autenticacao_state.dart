part of 'autenticacao_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AutenticacaoStatus.unknown,
    this.user,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.autenticado(Usuario user)
      : this._(status: AutenticacaoStatus.autenticado, user: user);

  const AuthenticationState.naoAutenticado()
      : this._(status: AutenticacaoStatus.naoAutenticado);

  final AutenticacaoStatus status;
  final Usuario user;

  @override
  List<Object> get props => [status, user];
}