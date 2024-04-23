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

Future<String> createServiceReportPDF(
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

  // Company Details
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Container(
        padding: pw.EdgeInsets.all(16),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header
            pw.Center(
              child: pw.Text(
                'COOLMATICS REPORT',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 16),
            // Organization, Project, Team
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Coolmatics LLC'),
                    pw.Text('cbrits@coolmatics.co.za'),
                    pw.Text('Management'), // Fixed spelling
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Report ID: DP-PEA-0003'),
                    pw.Text('Report Version: 3 Form Version: 3'),
                    pw.Text(
                      'Date: ${DateFormat('EEEE, dd MMMM yyyy, h:mm:ss a').format(DateTime.now())}',
                    ),
                  ],
                ),
              ],
            ),
            pw.Divider(
              thickness: 2,
              color: PdfColor.fromHex("#000000"),
            ),
            pw.SizedBox(height: 16),
            // Order Information
            pw.Text(
              'Order Information',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Table.fromTextArray(
              border: null,
              columnWidths: {
                0: pw.IntrinsicColumnWidth(flex: 1),
                1: pw.IntrinsicColumnWidth(flex: 3),
              },
              cellAlignment: pw.Alignment(0.0, 0.5),
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellStyle: pw.TextStyle(
                fontSize: 12,
              ),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
              data: [
                ['Job Number', '$jobNumber'],
                ['Client', '$client'],
                ['Contact Number', '$contactNumber'],
                ['Contact Person', '$contactPerson'],
                ['Email', '$email'],
              ],
            ),
            pw.SizedBox(height: 16),
            // Technician Information
            pw.Text(
              'Technician Information',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Table.fromTextArray(
              border: null,
              columnWidths: {
                0: pw.IntrinsicColumnWidth(flex: 1),
                1: pw.IntrinsicColumnWidth(flex: 3),
              },
              cellAlignment: pw.Alignment(0.0, 0.5),
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellStyle: pw.TextStyle(
                fontSize: 12,
              ),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
              data: [
                ['Technician', '$technician'],
                ['Assistant', '$assistant'],
              ],
            ),
            pw.SizedBox(height: 16),
            // Equipment and Location
            pw.Text(
              'Equipment and Location',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Table.fromTextArray(
              border: null,
              columnWidths: {
                0: pw.IntrinsicColumnWidth(flex: 1),
                1: pw.IntrinsicColumnWidth(flex: 3),
              },
              cellAlignment: pw.Alignment(0.0, 0.5),
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellStyle: pw.TextStyle(
                fontSize: 12,
              ),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
              data: [
                ['Site Area', '$siteArea'],
                ['Location', '$location'],
                ['Description', '$description'],
                ['Work Undertaken', '$workUndertaken'],
                [
                  'Equipment and Materials',
                  '${equipmentAndMaterials.join(', ')}'
                ],
              ],
            ),
            pw.SizedBox(height: 16),
            // Service Report and Photos
            pw.Text(
              'Service Report and Photos',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Table.fromTextArray(
              border: null,
              columnWidths: {
                0: pw.IntrinsicColumnWidth(flex: 1),
                1: pw.IntrinsicColumnWidth(flex: 3),
              },
              cellAlignment: pw.Alignment(0.0, 0.5),
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellStyle: pw.TextStyle(
                fontSize: 12,
              ),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
              data: [
                ['Date', '${DateFormat('yyyy-MM-dd').format(date)}'],
                ['Travel Time', '$travelTime'],
                ['Worked Hours (Normal)', '$workedHoursNormal'],
                ['Worked Hours (Overtime)', '$workedHoursOvertime'],
              ],
            ),
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
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
  return storagePath;
}
