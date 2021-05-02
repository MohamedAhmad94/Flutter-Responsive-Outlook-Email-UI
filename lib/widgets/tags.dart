import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:email_outlook/setup/constants.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WebsafeSvg.asset('assets/icons/Angle down.svg', width: 15),
            SizedBox(width: kDefaultPadding / 4),
            WebsafeSvg.asset("assets/Icons/Markup.svg", width: 20),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              'Tags',
              style: TextStyle(
                color: kGrayColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: kGrayColor,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding / 2),
        tagItem(context, color: Color(0xFF23CF91), title: 'Newsletters'),
        tagItem(context, color: Color(0xFF3A6FF7), title: 'Work'),
        tagItem(context, color: Color(0xFFF3CF50), title: 'Friends'),
        tagItem(context, color: Color(0xFF8338E1), title: 'Family'),
      ],
    );
  }

  InkWell tagItem(BuildContext? context,
      {@required Color? color, @required String? title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10.0, 0.0, 10),
        child: Row(
          children: [
            WebsafeSvg.asset(
              "assets/icons/Markup filled.svg",
              height: 18,
              color: color!,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              title!,
              style: TextStyle(
                color: kGrayColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
