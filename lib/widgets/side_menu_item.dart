import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:email_outlook/widgets/counter_badge.dart';
import 'package:email_outlook/setup/constants.dart';

class SideMenuItem extends StatelessWidget {
  final bool? isActive;
  final bool? isHover;
  final bool? showBorder;
  final int? itemCount;
  final String? icon;
  final String? title;
  final VoidCallback? press;

  const SideMenuItem(
      {Key? key,
      this.isActive,
      this.isHover = false,
      this.itemCount,
      this.showBorder = true,
      @required this.icon,
      @required this.title,
      @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder!
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      icon!,
                      height: 20,
                      color: (isActive! || isHover!)
                          ? kPrimaryColor
                          : kSecondaryColor,
                    ),
                    SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize: 15,
                          color: (isActive! || isHover!)
                              ? kTextColor
                              : kGrayColor),
                    ),
                    Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
