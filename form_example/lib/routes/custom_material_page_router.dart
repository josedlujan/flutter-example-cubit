import 'package:flutter/material.dart';

class CustomMaterialPageRouter<T> extends MaterialPageRoute<T> {
  CustomMaterialPageRouter({required WidgetBuilder builder})
      : super(builder: builder);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
