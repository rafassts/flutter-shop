import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericProgressIndicator extends StatelessWidget {
  const GenericProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();
  }
}
