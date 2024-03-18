import 'package:flutter/material.dart';
import 'package:task_manager_flutter/resources/tm_color.dart';

class TMCardNoitfication extends StatelessWidget {
  const TMCardNoitfication({
    super.key,
    required this.title,
    this.isTurnOn = false,
    required this.onChanged,
  });
  final String title;
  final Function() onChanged;
  final bool isTurnOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onChanged,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              height: 22.0,
              width: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: isTurnOn ? TMColor.primarySwith : TMColor.secondarySwith,
              ),
              child: Row(
                mainAxisAlignment:
                    isTurnOn ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    height: 18.0,
                    width: 18.0,
                    decoration: const BoxDecoration(
                      color: TMColor.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
