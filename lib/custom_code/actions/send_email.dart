// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_email_sender/flutter_email_sender.dart'; // Import for sending emails

Future<void> sendEmail(
  BuildContext context,
) async {
  final Email email = Email(
    body: 'Email body',
    subject: 'Email subject',
    recipients: ['example@example.com'],
    cc: ['cc@example.com'],
    bcc: ['bcc@example.com'],
    // attachmentPaths: [attachmants],
    isHTML: false,
  );

  String platformResponse;

  try {
    await FlutterEmailSender.send(email);
    platformResponse = 'Email sent successfully';
  } catch (error) {
    platformResponse = 'Failed to send email: $error';
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(platformResponse),
    ),
  );
}
