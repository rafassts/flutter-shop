import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/theme.bloc.dart';

import '../../../settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(height: 60),
          Text(
            "Tema atual: ${Settings.theme}",
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text("Light"),
            onPressed: () {
              bloc.save("light");
              bloc.change('light');
            },
          ),
          TextButton(
            child: Text("Dark"),
            onPressed: () {
              bloc.save("dark");
              bloc.change('dark');
            },
          ),
          TextButton(
            child: Text("Dark Yellow"),
            onPressed: () {
              bloc.save("dark-yellow");
              bloc.change('dark-yellow');
            },
          ),
        ],
      ),
    );
  }
}
