import 'package:flutter/material.dart';
import 'package:email_outlook/setup/responsive.dart';
import 'package:email_outlook/setup/constants.dart';
import 'package:email_outlook/setup/extensions.dart';
import 'package:email_outlook/widgets/side_menu_item.dart';
import 'package:email_outlook/widgets/tags.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kLightBGColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/Logo Outlook.png', width: 45),
                  Spacer(),
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding / 2),
              Container(
                width: double.infinity,
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 20, color: Colors.black),
                      Text('New Message', style: TextStyle(color: kTextColor)),
                    ],
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                ).addNeumorphism(),
              ),
              SizedBox(height: kDefaultPadding),
              Container(
                width: double.infinity,
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox, size: 20, color: Colors.black),
                      Text('Get Messages', style: TextStyle(color: kTextColor)),
                    ],
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: kDarkBGColor,
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                ).addNeumorphism(),
              ),
              SizedBox(height: kDefaultPadding / 2),
              SideMenuItem(
                  icon: 'assets/icons/Inbox.svg',
                  title: 'Inbox',
                  press: () {},
                  itemCount: 3,
                  isActive: true),
              SideMenuItem(
                  icon: 'assets/icons/Send.svg',
                  title: 'Sent',
                  press: () {},
                  isActive: false),
              SideMenuItem(
                  icon: 'assets/icons/File.svg',
                  title: 'Drafts',
                  press: () {},
                  isActive: false),
              SideMenuItem(
                  icon: 'assets/icons/Trash.svg',
                  title: 'Deleted',
                  press: () {},
                  isActive: false,
                  showBorder: false),
              SizedBox(height: kDefaultPadding / 2),
              Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
