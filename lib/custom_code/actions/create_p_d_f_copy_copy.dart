// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Import for accessing local storage

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> createPDFCopyCopy() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final pdfSaved = await pdf.save();

  final now = DateTime.now();

  // Format the date and time as a string
  final formattedDateTime =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';

  // Set the file name to the formatted date and time string
  final fileName = '$formattedDateTime.pdf';

  // Get the directory where you want to store the file
  final directory = await getApplicationDocumentsDirectory();

  // Combine the directory path and file name to create the full storage path
  final storagePath = '${directory.path}/$fileName';

  // Save the PDF file locally
  final File file = File(storagePath);
  await file.writeAsBytes(pdfSaved);

  // PRINT IT
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
