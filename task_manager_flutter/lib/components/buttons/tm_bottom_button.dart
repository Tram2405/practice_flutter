import 'package:flutter/material.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.text,
    this.isAction = false,
    this.onPressed,
  });

  final String text;
  final bool isAction;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: TMColor.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF494949).withOpacity(0.1),
              offset: const Offset(0.0, -5.0),
              blurRadius: 5.0,
            )
          ]),
      child: TMElevateButton(
        onPressed: onPressed,
        text: text,
         color:
                isAction ? TMColor.primary : TMColor.primaryContainer,
        textColor: TMColor.onTask,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
