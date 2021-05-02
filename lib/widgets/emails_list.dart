import 'package:email_outlook/screens/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_outlook/models/email.dart';
import 'package:email_outlook/widgets/side_menu.dart';
import 'package:email_outlook/widgets/email_card.dart';
import 'package:email_outlook/setup/responsive.dart';
import 'package:email_outlook/setup/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class EmailsList extends StatefulWidget {
  const EmailsList({Key? key}) : super(key: key);
  @override
  _EmailsListState createState() => _EmailsListState();
}

class _EmailsListState extends State<EmailsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kDarkBGColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          }),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Search',
                          fillColor: kLightBGColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding * 0.75),
                            child: WebsafeSvg.asset(
                              "assets/icons/Search.svg",
                              width: 25,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: emails.length,
                  itemBuilder: (context, index) {
                    return EmailCard(
                      isActive:
                          Responsive.isMobile(context) ? false : index == 0,
                      email: emails[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmailScreen(email: emails[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
