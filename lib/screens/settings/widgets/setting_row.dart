import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onetime/constants/colors.dart';
import 'package:provider/provider.dart';

class SettingTitle extends StatelessWidget {
  SettingTitle({
    this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: black,
              fontSize: 13.0,
            ),
          ),
        ),
      ],
    );
  }
}

class SettingRow extends StatelessWidget {
  SettingRow({
    @required this.title,
    this.onTap,
    this.onChange,
    this.isEnable,
    this.isCheckBox = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isEnable;
  final ValueChanged<bool> onChange;
  final bool isCheckBox;

  @override
  Widget build(BuildContext context) {
    final verticalPadding = onChange != null ? 4.0 : 12.0;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: black,
                    fontSize: 17.0,
                  ),
                ),
                isCheckBox
                    ? buildRightCheckBox(context)
                    : buildRightItem(context),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            indent: 20,
            thickness: .5,
          ),
        ],
      ),
    );
  }

  Widget buildRightItem(BuildContext context) {
    if (onChange != null) {
      return CupertinoSwitch(
        activeColor: blue,
        onChanged: onChange,
        value: isEnable,
      );
    }
    return Icon(Icons.navigate_next);
  }

  Widget buildRightCheckBox(BuildContext context) {
    if (onChange != null) {
      return const Icon(
        Icons.check_box_outline_blank,
      );
    }
    return const Icon(
      Icons.check_box_outline_blank,
    );
  }
}

class SettingDescription extends StatelessWidget {
  SettingDescription({
    this.descriptions,
  });

  final List<Widget> descriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
          Expanded(
            child: Wrap(
              children: <Widget>[
                ...descriptions,
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
