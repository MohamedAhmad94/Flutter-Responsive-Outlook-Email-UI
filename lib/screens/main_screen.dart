import 'package:email_outlook/screens/email_screen.dart';
import 'package:email_outlook/setup/responsive.dart';
import 'package:email_outlook/widgets/emails_list.dart';
import 'package:email_outlook/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: EmailsList(),
        tablet: Row(
          children: [
            Expanded(flex: 6, child: EmailsList()),
            Expanded(
              flex: 9,
              child: EmailScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(flex: _size.width > 1340 ? 2 : 4, child: SideMenu()),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: EmailsList(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
