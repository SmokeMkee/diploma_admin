import 'package:diploma_admin/constants/app_styles.dart';
import 'package:flutter/material.dart';

void showErrorDialog(
  BuildContext context, {
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Error message',
          style: AppStyles.s20w600,
        ),
        content: Column(
          children: [
            Text(
              message,
              style: AppStyles.s15w500,
            ),
          ],
        ),
      );
    },
  );
}


class Message {
  Message({
    required this.message,
  });

  String message;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}


