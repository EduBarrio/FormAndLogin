import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:formandlogin/src/bloc/validators.dart';

class LoginBloc with Validators {

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream    => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get formValidStream =>
    CombineLatestStream.combine2(emailStream, passwordStream, (x, y) => true);

  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;



  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

  get password => _passwordController.value;
  get email => _emailController.value;

}