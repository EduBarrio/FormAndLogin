import 'package:flutter/material.dart';
import 'package:formandlogin/src/bloc/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.ofLoginBloc(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Usuario: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}')
        ],
      ),
    );
  }
}
