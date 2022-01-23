import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/user.bloc.dart';
import 'package:shop/models/create-user.model.dart';
import 'package:shop/ui/shared/validators/custom.validators.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var user =
      new CreateUserModel(email: "", name: "", username: "", password: "");
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
                    labelText: "Nome",
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
                    return "Nome Inválido";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  user.name = value != null ? value : "";
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) => CustomValidators.isEmail(value),
                onSaved: (value) {
                  user.email = value != null ? value : "";
                },
              ),
              SizedBox(height: 20),
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
                  user.username = value != null ? value : "";
                },
              ),
              SizedBox(height: 20),
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
                  user.password = value != null ? value : "";
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    create(context, bloc, user);
                  }
                },
                child: Text("Cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }

  create(BuildContext context, UserBloc bloc, CreateUserModel user) async {
    var newUser = await bloc.create(user);

    // a tela anterior já está preparada para receber um user logado
    if (newUser != null) {
      Navigator.pop(context);
      return;
    }

    final snackBar = SnackBar(content: Text("Problemas ao criar usuário"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
