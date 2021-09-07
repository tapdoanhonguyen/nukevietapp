import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/themes/default/styles.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';

class SamplePage extends StatefulWidget {
  final String title;
  const SamplePage({this.title = 'Sample'});

  @override
  State<StatefulWidget> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.gradientAppBar(
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title,
            style: AppStyle.appBarTitle,
          ),
          actions: [],
        ),
      ),
      body: Container(
        color: AppColor.nearlyWhite,
      ),
    );
  }
}