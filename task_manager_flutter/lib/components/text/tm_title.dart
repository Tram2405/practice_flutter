import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMTitle extends StatefulWidget {
  const TMTitle({
    super.key,
    required this.title,
    this.textStyle,
    this.isRedMore = false,
  });
  final String title;
  final TextStyle? textStyle;
  final bool isRedMore;

  @override
  State<TMTitle> createState() => _TMTitleState();
}

class _TMTitleState extends State<TMTitle> {
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isRedMore ? () => setState(() {
        isReadMore = !isReadMore;
      }) : null,
      child: Text(
        widget.title,
        style: widget.textStyle ?? context.textTheme.displayLarge,
        maxLines: isReadMore ? null : 2,
        overflow: isReadMore ? null : TextOverflow.ellipsis,
      ),
    );
  }
}
