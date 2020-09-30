part of 'autenticacao_bloc.dart';

abstract class AutenticacaoEvent extends Equatable {
  const AutenticacaoEvent();

  @override
  List<Object> get props => [];
}

class AutenticacaoStatusTrocado extends AutenticacaoEvent {
  const AutenticacaoStatusTrocado(this.status);

  final AutenticacaoStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AutenticacaoEvent {}