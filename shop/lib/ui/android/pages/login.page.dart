import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/user.bloc.dart';
import 'package:shop/models/authenticate-user.model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var username = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Usuário",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Usuário Inválido";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value != null ? value : "";
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Senha Inválida";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value != null ? value : "";
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    authenticate(context, bloc);
                  }
                },
                child: Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context, UserBloc bloc) async {
    var user = await bloc.authenticate(
        new AuthenticateModel(username: username, password: password));

    // a tela anterior já está preparada para receber um user logado
    if (user != null) {
      Navigator.pop(context);
      return;
    }

    final snackBar = SnackBar(content: Text("Usuário ou senha inválidos"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
