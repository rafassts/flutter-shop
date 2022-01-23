import 'package:flutter/material.dart';
import 'package:shop/ui/android/pages/Signup.page.dart';
import 'package:shop/ui/android/pages/login.page.dart';

class UnauthenticatedUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text("Autentique-se"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()));
          },
          child: Text("Ainda não sou cadastrado"),
        )
      ],
    );
  }
}
