import 'dart:async';

class Validators {

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {

      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Password lenght must be bigger than 6');
      }

    }
  );



  final emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {

        Pattern emailPattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
        RegExp regExp = new RegExp(emailPattern);

        if (regExp.hasMatch(email)){
          sink.add(email);
        } else {
          sink.addError('Email not correct');
        }
        
      }
  );

}