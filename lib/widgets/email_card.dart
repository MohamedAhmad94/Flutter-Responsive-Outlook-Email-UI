import 'package:email_outlook/setup/constants.dart';
import 'package:email_outlook/setup/extensions.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:email_outlook/models/email.dart';

class EmailCard extends StatelessWidget {
  final Email? email;
  final bool? isActive;
  final VoidCallback? press;

  const EmailCard({Key? key, this.email, this.isActive = true, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive! ? kPrimaryColor : kDarkBGColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email!.image!),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: '${email!.name} \n',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive! ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email!.subject,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isActive! ? Colors.white : kTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email!.time!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: isActive! ? Colors.white70 : kTextColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          if (email!.isAttachmentAvailable!)
                            WebsafeSvg.asset('assets/icons/Paperclip.svg',
                                color: isActive! ? Colors.white70 : kGrayColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email!.emailBody!,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: isActive! ? Colors.white70 : kTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (email!.isChecked!)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 5,
                  borderRadius: 10,
                  offset: Offset(2, 2),
                ),
              ),
            if (email!.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: WebsafeSvg.asset(
                  'assets/Icons/Markup filled.svg',
                  height: 18,
                  color: email!.tagColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
