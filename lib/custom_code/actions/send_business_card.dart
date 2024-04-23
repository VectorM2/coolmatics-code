// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:emailjs/emailjs.dart';

Future sendBusinessCard(
  BuildContext context,
  String userEmail,
  String toName,
  String message,
  String subject,
) async {
  // Check if any of the fields are empty
  if (userEmail.isEmpty || toName.isEmpty || message.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in all fields.'),
        backgroundColor: Colors.red,
      ),
    );
    return; // Exit the function early if any field is empty
  }

  try {
    await EmailJS.send(
      'service_v5nd5yn',
      'template_ls3zyel',
      {
        'user_email': '$userEmail',
        'to_name': '$toName',
        'message': '$message',
        'subject': '$subject'
      },
      const Options(
        publicKey: 'X_hNA-xV0jln1LByl',
        privateKey: 'lO8OzHw6YglNb8RdCl9Pl',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email sent successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (error) {
    if (error is EmailJSResponseStatus) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send email: ${error.status}: ${error.text}'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
