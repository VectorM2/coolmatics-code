// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:android_intent_plus/android_intent.dart';

Future<void> intent(BuildContext context, String email, String attachment,
    String subject, String body) async {
  try {
    // Add your function code here!
    await _openGmail(context, email, attachment, subject, body); // Pass context
  } catch (e) {
    // Show a SnackBar with the error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<void> _openGmail(BuildContext context, String email, String attachment,
    String subject, String body) async {
  // Add context parameter
  // Create a URI from the file path
  Uri uri = Uri.file(attachment);
  List<String> directoryList = [];
  directoryList.add(uri.toString()); // Convert URI to string

  final intent = AndroidIntent(
    action: 'android.intent.action.SEND',
    arguments: {
      'android.intent.extra.SUBJECT': subject,
      'android.intent.extra.TEXT': body, // Adding the email body
    },
    arrayArguments: {
      'android.intent.extra.EMAIL': [email],
      'android.intent.extra.STREAM': directoryList, // Pass list of strings
    },
    package: 'com.google.android.gm',
    type: 'message/rfc822',
  );

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('An error occurred: $directoryList'),
      backgroundColor: Colors.red,
    ),
  );
  await intent.launch(); // Await the launch action
}
