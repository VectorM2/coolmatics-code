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
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart'; // Import this package for date formatting

Future<List<int>> serviceReport(
  BuildContext context,
  String photo,
  int jobNumber,
  String client,
  String contactNumber,
  String contactPerson,
  String email,
  String siteArea,
  String location,
  String description,
  String workUndertaken,
  List<String> equipmentAndMaterials,
  String technician,
  String assistant,
  DateTime date,
  int travelTime,
  int workedHoursNormal,
  int workedHoursOvertime,
) async {
  final pdf = pw.Document();

  // Build PDF content
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Container(
        padding: pw.EdgeInsets.all(16),
        color: PdfColor.fromHex("#FFFFFF"), // Set background color to white
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Invoice Title
            pw.Center(
              child: pw.Text(
                'SERVICE REPORT',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Divider(
                thickness: 2,
                color: PdfColor.fromHex("#000000")), // Horizontal line
            pw.SizedBox(height: 16),
            // Service details
            pw.Text('Job Number: $jobNumber'),
            pw.Text('Client: $client'),
            pw.Text('Contact Number: $contactNumber'),
            pw.Text('Contact Person: $contactPerson'),
            pw.Text('Email: $email'),
            pw.Text('Site Area: $siteArea'),
            pw.Text('Location: $location'),
            pw.Text('Description: $description'),
            pw.Text('Work Undertaken: $workUndertaken'),
            pw.Text(
                'Equipment and Materials: ${equipmentAndMaterials.join(', ')}'),
            pw.Text('Technician: $technician'),
            pw.Text('Assistant: $assistant'),
            pw.Text('Date: ${DateFormat('yyyy-MM-dd').format(date)}'),
            pw.Text('Travel Time: $travelTime'),
            pw.Text('Worked Hours (Normal): $workedHoursNormal'),
            pw.Text('Worked Hours (Overtime): $workedHoursOvertime'),
          ],
        ),
      ),
    ),
  );

  // Save PDF locally
  final pdfData = await pdf.save();
  final now = DateTime.now();
  final formattedDateTime =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';
  final fileName = '$formattedDateTime.pdf';
  final directory = await getApplicationDocumentsDirectory();
  final storagePath = '${directory.path}/$fileName';
  final File file = File(storagePath);
  await file.writeAsBytes(pdfData);

  // Print PDF
  // This line is commented out as it seems you're not using the Printing package to print the PDF.
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
  return pdfData;
}
