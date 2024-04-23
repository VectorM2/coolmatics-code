// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';

Future<void> intentCopy(BuildContext context, String email, String attachment,
    String subject, String body) async {
  try {
    await _openGmail(context, email, attachment, subject, body);
  } catch (e) {
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
  // Check if the file exists
  if (!File(attachment).existsSync()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('File not found at path: $attachment'),
        backgroundColor: Colors.red,
      ),
    );
    return; // Return if the file doesn't exist
  }

  try {
    // Convert file path to content URI
    final uri = Uri.parse(attachment);
    final contentUri = await getUriForFile(uri);

    final intent = AndroidIntent(
      action: 'android.intent.action.SEND',
      arguments: {
        'android.intent.extra.SUBJECT': subject,
        'android.intent.extra.TEXT': body,
      },
      arrayArguments: {
        'android.intent.extra.EMAIL': [email],
        'android.intent.extra.STREAM': [contentUri.toString()],
      },
      package: 'com.google.android.gm',
      type: 'message/rfc822',
    );

    await intent.launch();
    // ignore: nullable_type_in_catch_clause
  } on PlatformException catch (e) {
    print("Error: ${e.message}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: ${e.message}'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<String> getUriForFile(Uri uri) async {
  final MethodChannel _channel =
      MethodChannel('plugins.flutter.io/file_provider');
  final String? contentUri =
      await _channel.invokeMethod('getUriForFile', <String, dynamic>{
    'uri': uri.toString(),
  });
  if (contentUri == null) {
    throw PlatformException(
      code: 'GET_URI_FAILED',
      message: 'Failed to get content URI for file: $uri',
    );
  }
  return contentUri;
}
