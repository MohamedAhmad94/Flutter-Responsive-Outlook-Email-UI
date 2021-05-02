import 'package:flutter/material.dart';
import 'package:email_outlook/setup/constants.dart';
import 'package:email_outlook/setup/extensions.dart';

class CounterBadge extends StatelessWidget {
  final int? count;
  const CounterBadge({Key? key, @required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: kBadgeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ).addNeumorphism(
      offset: Offset(4, 4),
      blurRadius: 5,
      borderRadius: 10,
      topShadowColor: Colors.white,
      bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
    );
  }
}
