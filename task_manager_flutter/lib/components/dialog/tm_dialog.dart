import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

typedef MyDataType = BuildContext;
typedef MyFunction = Function()?;

class TMDialog {
  TMDialog._();

  static void dialog(
    MyDataType context, {
    required title,
    required content,
    MyFunction action,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TMColor.onSecondary,
        surfaceTintColor: Colors.transparent,
        title: Center(
          child: Text(
            title,
            style: context.textTheme.displaySmall,
          ),
        ),
        content: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: TMColor.primaryIcon),
                // const TextStyle(color: AppColor.textHint, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textDialog(
                context,
                title: 'YES',
                onPressed: () {
                  action?.call();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 40.0),
              textDialog(
                context,
                title: 'NO',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  static GestureDetector textDialog(BuildContext context,
      {required String title, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style:
            context.textTheme.labelLarge?.copyWith(color: TMColor.primaryIcon),
      ),
    );
  }
}
