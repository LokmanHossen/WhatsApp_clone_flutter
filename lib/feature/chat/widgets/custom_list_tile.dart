import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/extension/custom_theme_extension.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    this.subTitle,
    this.trailing,
  });

  final String title;
  final IconData leading;
  final String? subTitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(25, 2, 10, 2),
      title: Text(title),
      subtitle: subTitle != null
          ? Text(
              subTitle!,
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            )
          : null,
      leading: Icon(leading),
      trailing: trailing,
    );
  }
}
