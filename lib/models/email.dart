import 'package:flutter/material.dart';

class Email {
  final String? name;
  final String? image;
  final String? subject;
  final String? emailBody;
  final String? time;
  final bool? isAttachmentAvailable;
  final bool? isChecked;
  final Color? tagColor;

  Email(
      {this.name,
      this.image,
      this.subject,
      this.emailBody,
      this.time,
      this.isAttachmentAvailable,
      this.isChecked,
      this.tagColor});
}

List<Email> emails = List.generate(
  data.length,
  (index) => Email(
    name: data[index]['name'],
    image: data[index]['image'],
    subject: data[index]['subject'],
    isAttachmentAvailable: data[index]['isAttachmentAvailable'],
    isChecked: data[index]['isChecked'],
    tagColor: data[index]['tagColor'],
    time: data[index]['time'],
    emailBody: data[index]['emailBody'],
  ),
);

List<Map<String, dynamic>> data = [
  {
    "name": "Apple",
    "image": "assets/images/user_1.png",
    "subject": "iPhone 12 is here",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": null,
    "time": "Now",
    "emailBody":
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  },
  {
    "name": "Elvia Atkins",
    "image": "assets/images/user_2.png",
    "subject": "Inspiration for our new home",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "15:32",
    "emailBody":
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  },
  {
    "name": "Marvin Kiehn",
    "image": "assets/images/user_3.png",
    "subject": "Business-focused empowering the world",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "14:27",
    "emailBody":
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  },
  {
    "name": "Domenic Bosco",
    "image": "assets/images/user_4.png",
    "subject": "The fastest way to Design",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "10:43",
    "emailBody":
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  },
  {
    "name": "Elenor Bauch",
    "image": "assets/images/user_5.png",
    "subject": "New job opportunities",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color(0xFF3A6FF7),
    "time": "9:58",
    "emailBody":
        'Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed.',
  }
];
