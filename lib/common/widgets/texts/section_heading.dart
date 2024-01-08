import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.buttonTitle = 'View all',
    required this.title,
    this.textColor,
    this.showActionButton = true,
    this.onPress,
  });
  final String buttonTitle, title;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPress, child: Text(buttonTitle)),
      ],
    );
  }
}
