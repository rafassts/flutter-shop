import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/user.bloc.dart';

class AuthenticatedUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(bloc.user!.image),
                  ),
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 4,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
            SizedBox(height: 20),
            Text("Bem vindo, ${bloc.user!.name}"),
            SizedBox(height: 10),
            TextButton(
              onPressed: bloc.logout,
              child: Text("Sair"),
            )
          ],
        ),
      ),
    );
  }
}
