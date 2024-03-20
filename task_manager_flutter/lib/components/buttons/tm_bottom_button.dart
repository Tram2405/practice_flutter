import 'package:flutter/material.dart';
import 'package:task_manager_flutter/components/buttons/tm_elevatebutton.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMBottomButton extends StatelessWidget {
  ///A bottom button in an interface
  /// The [text] arguments must not be null.
  const TMBottomButton({
    required this.text,
    this.isAction = false,
    this.onPressed,
    super.key,
  });

  ///[text] : The text content of the button
  final String text;

  ///[isAction] : Determines whether the button is a primary action or not
  final bool isAction;

  ///[onPressed] : The callback function is called when the button is pressed
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
        ],
      ),

      ///If [isAction] is True, the button will take action [onPressed],
      ///The button's background color will be TMColor.primary
      ///Opposite, [isAction] = null, The button's background color will be TMColor.primaryContainer
      child: TMElevateButton(
        onPressed: isAction ? onPressed : null,
        text: text,
        color: isAction ? TMColor.primary : TMColor.primaryContainer,
        textColor: TMColor.onTask,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
