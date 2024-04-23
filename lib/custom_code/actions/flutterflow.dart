// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> flutterflow(
  BuildContext context,
  String email,
  String filepath,
  List<String> attachments,
  String subject,
  String body,
) async {
//adding file path to attachment list
  attachments.add(filepath);

  final Email emailToSend = Email(
    body: body,
    subject: subject,
    recipients: [email],
    attachmentPaths: attachments,
  );

  try {
    await FlutterEmailSender.send(emailToSend);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email sent successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  } catch (error) {
    print('Error sending email: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error sending email: $error'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
