import 'package:flutter/material.dart';
import 'package:onetime/constants/colors.dart';
import 'package:onetime/constants/texts.dart';
import 'package:onetime/screens/settings/widgets/setting_row.dart';

class SettingsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            ...buildProfileSection(context),
            const SizedBox(height: 10),
            ...buildDescriptionSection(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<Widget> buildProfileSection(BuildContext context) {
    return [
      SettingTitle(
        title: themeSettings,
      ),
      SettingRow(
        title: darkMode,
        isEnable: false,
        onChange: (bool value) {},
      ),
    ];
  }

  List<Widget> buildMessageSection(BuildContext context) {
    return [
      SettingTitle(
        title: accountSettings,
      ),
      SettingRow(
        title: darkMode,
        isEnable: false,
        onChange: (bool value) {},
      ),
    ];
  }

  List<Widget> buildDescriptionSection(BuildContext context) {
    final privacyPolicyUrl = 'https://github.com/kayanoki-akinori/onetime';
    return [
      SettingTitle(
        title: appInfo,
      ),
      SettingRow(
        title: privacyPolicyTitle,
        onTap: () {},
      ),
      SettingRow(
        title: appInfo,
        onTap: () {},
      ),
      SettingRow(
        title: licenseInfo,
        onTap: () {},
      ),
      SettingRow(
        title: inquiry,
        onTap: () {},
      ),
      SettingRow(
        title: reviewApp,
        onTap: () {},
      ),
    ];
  }
}
