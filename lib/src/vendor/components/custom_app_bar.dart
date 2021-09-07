import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/include/constants.dart';
import 'package:nukeviet/src/themes/default/styles.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool canBack;

  const GradientAppBar({
    Key key,
    this.title = '',
    this.actions = const [],
    this.canBack = true,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return new Size.fromHeight(AppBar().preferredSize.height);
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppConstant.gradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: canBack ? BackButton(onPressed: () => Get.back()) : null,
            title: Text(
              title,
              style: AppStyle.appBarTitle,
            ),
            actions: actions,
          )
        ],
      ),
    );
  }
}