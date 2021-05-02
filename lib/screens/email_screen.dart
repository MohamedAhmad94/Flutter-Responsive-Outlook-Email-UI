import 'package:email_outlook/setup/constants.dart';
import 'package:email_outlook/widgets/email_header.dart';
import 'package:flutter/material.dart';
import 'package:email_outlook/models/email.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailScreen extends StatelessWidget {
  final Email? email;

  const EmailScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              EmailHeader(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(emails[1].image!),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: emails[1].name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '  <elvia.atkins@gmail.com> to Jerry Torp',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        emails[1].subject!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  emails[1].time!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: kGrayColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: kDefaultPadding),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  width: constraints.maxWidth > 850
                                      ? 800
                                      : constraints.maxWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        emails[1].emailBody!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          color: kTextColor,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(height: kDefaultPadding),
                                      Row(
                                        children: [
                                          Text(
                                            '6 Attachements',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Download All',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: kDefaultPadding / 4),
                                          WebsafeSvg.asset(
                                            'assets/icons/Download.svg',
                                            height: 15,
                                            color: kGrayColor,
                                          ),
                                        ],
                                      ),
                                      Divider(thickness: 1),
                                      SizedBox(height: kDefaultPadding / 2),
                                      Container(
                                        height: 200,
                                        child: StaggeredGridView.countBuilder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisCount: 4,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Img_$index.png',
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                          staggeredTileBuilder: (index) =>
                                              StaggeredTile.count(
                                                  2, index.isOdd ? 2 : 1),
                                          mainAxisSpacing: kDefaultPadding,
                                          crossAxisSpacing: kDefaultPadding,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
