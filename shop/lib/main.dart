import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/blocs/cart.bloc.dart';
import 'package:shop/blocs/home.bloc.dart';
import 'package:shop/blocs/theme.bloc.dart';
import 'package:shop/blocs/user.bloc.dart';
import 'package:shop/ui/android/pages/tabs.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //singleton - substriptions
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
        ChangeNotifierProvider<CartBloc>.value(value: CartBloc()),
        ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),
        ChangeNotifierProvider<ThemeBloc>.value(value: ThemeBloc())
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeBloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      theme: themeBloc.theme,
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      home: DefaultTabController(
        //navegação e telas
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
