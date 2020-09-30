import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_rdo/screens/agenda_screen.dart';
import 'package:smart_rdo/screens/login/login_screen.dart';
import 'package:smart_rdo/splash/screen/splash_screen.dart';
import 'package:autenticacao_repositorio/autenticacao_repositorio.dart';
import 'package:smart_rdo/autenticacao/autenticacao.dart';
import 'package:usuario_repositorio/usuario_repositorio.dart';



class RdoApp extends StatelessWidget{
  const RdoApp({
    Key key,
    @required this.autenticacaoRepositorio,
    @required this.usuarioRepositorio,
}) : assert(autenticacaoRepositorio != null),
     assert(usuarioRepositorio != null),
     super(key: key);

  final AuthenticationRepository autenticacaoRepositorio;
  final UsuarioRepositorio usuarioRepositorio;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: autenticacaoRepositorio,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: autenticacaoRepositorio,
          usuarioRepositorio: usuarioRepositorio,
        ),
        child: RdoAppScreen(),
      ),
    );
  }
}

class RdoAppScreen extends StatefulWidget {
  @override
  _RdoAppState createState() => _RdoAppState();
}

class _RdoAppState extends State<RdoAppScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child){
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state){
            if(state.status == AutenticacaoStatus.autenticado){
              _navigator.pushAndRemoveUntil<void>(AgendaScreen.route(), (route) => false);
            }
            if(state.status == AutenticacaoStatus.naoAutenticado){
              _navigator.pushAndRemoveUntil<void>(LoginScreen.route(), (route) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}
