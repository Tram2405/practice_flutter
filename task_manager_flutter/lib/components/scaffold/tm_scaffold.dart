import 'package:flutter/material.dart';

class TMScaffold extends StatelessWidget {
  const TMScaffold({
    super.key,
    this.backgroundColor,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
  });
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all( 16.0),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
