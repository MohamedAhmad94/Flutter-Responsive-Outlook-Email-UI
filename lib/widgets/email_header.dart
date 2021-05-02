import 'package:email_outlook/setup/constants.dart';
import 'package:email_outlook/setup/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter/material.dart';

class EmailHeader extends StatelessWidget {
  const EmailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
              icon: WebsafeSvg.asset('assets/icons/Trash.svg', width: 25),
              onPressed: () {}),
          IconButton(
              icon: WebsafeSvg.asset('assets/icons/Reply.svg', width: 25),
              onPressed: () {}),
          IconButton(
              icon: WebsafeSvg.asset('assets/icons/Reply all.svg', width: 25),
              onPressed: () {}),
          IconButton(
              icon: WebsafeSvg.asset('assets/icons/Transfer.svg', width: 25),
              onPressed: () {}),
          Spacer(),
          if (Responsive.isDesktop(context))
            IconButton(
                icon: WebsafeSvg.asset('assets/icons/Printer.svg', width: 25),
                onPressed: () {}),
          IconButton(
              icon: WebsafeSvg.asset('assets/icons/Markup.svg', width: 25),
              onPressed: () {}),
          IconButton(
              icon:
                  WebsafeSvg.asset('assets/icons/More vertical.svg', width: 25),
              onPressed: () {}),
        ],
      ),
    );
  }
}
