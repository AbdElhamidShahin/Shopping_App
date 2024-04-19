import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class settings_screen extends StatelessWidget {
  const settings_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'DARK MOODE',
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    'DARK MODE ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between text and switch
                Switch(
                  value: AdaptiveTheme.of(context).mode.isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Divider(
                height: 0.1,
                color: Colors.grey,
                thickness: 1,
                indent: 30,
                endIndent: 30),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'GENERAL',
                style: TextStyle(color: Colors.grey, fontSize: 22),
              ),
            ),
            Settings_Text(
              icon1: Icons.person_outline_sharp,
              text: 'Account',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Settings_Text(
              icon1: Icons.notifications_none_outlined,
              text: 'Notifications',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Settings_Text(
              icon1: Icons.countertops_outlined,
              text: 'Coupons',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Settings_Text(
              icon1: Icons.logout_outlined,
              text: 'Logout',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Settings_Text(
              icon1: Icons.delete,
              text: 'Delete account',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'FEEDBACK',
                style: TextStyle(color: Colors.grey, fontSize: 22),
              ),
            ),
            Settings_Text(
              icon1: Icons.report_problem_outlined,
              text: 'Report a bug',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
            Settings_Text(
              icon1: Icons.send_and_archive_outlined,
              text: 'Send feedback',
              icon2: Icons.arrow_forward_ios_sharp,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
