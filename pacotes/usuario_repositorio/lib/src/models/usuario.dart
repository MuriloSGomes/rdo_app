import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  const Usuario(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}