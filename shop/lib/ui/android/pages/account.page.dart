import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/user.bloc.dart';
import 'package:shop/ui/android/pages/settings.page.dart';
import 'package:shop/ui/shared/widgets/account/authenticated-user.widget.dart';
import 'package:shop/ui/shared/widgets/account/unauthenticated-user.model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: bloc.user == null ? UnauthenticatedUser() : AuthenticatedUser(),
    );
  }
}
