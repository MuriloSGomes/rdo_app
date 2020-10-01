import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_rdo/bloc/login/login_bloc.dart';
import 'package:smart_rdo/login/login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Falha na autenticação!')),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          child: Column(
            children: <Widget>[
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.username != current.username,
                builder: (context, state) {
                  return TextFormField(
                    key: const Key('loginForm_textFormField'),
                    onChanged: (username) => context
                        .bloc<LoginBloc>()
                        .add(LoginUsernameChanged(username)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      labelText: "Email or Username",
                      labelStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      suffixIcon: Icon(Icons.person_outline),
                      errorText:
                          state.username.invalid ? 'Username inválido' : null,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return TextField(
                      key: const Key('loginForm_textField'),
                      keyboardType: TextInputType.text,
                      onChanged: (password) => context
                          .bloc<LoginBloc>()
                          .add(LoginPasswordChanged(password)),
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(1),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                        errorText:
                            state.password.invalid ? 'invalid password' : null,
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return state.status.isSubmissionInProgress
                        ? const CircularProgressIndicator()
                        : Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              color: Color(0xFF20B2AA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                            child: FlatButton(
                              key: const Key('login_form_flatButton'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () => state.status.isValidated
                                  ? () {
                                      context
                                          .bloc<LoginBloc>()
                                          .add(const LoginSubmitted());
                                    }
                                  : null,
                            ),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
