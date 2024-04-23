// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> createOrderPDF(
  BuildContext context,
  int orderNumber,
  String supplier,
  String siteArea,
  String siteLocation,
  List<String> orderedItems,
  String technician,
  String date,
  String traveltime,
  String technicianSignature,
) async {
  // Input validation
  if (supplier.isEmpty ||
      siteArea.isEmpty ||
      siteLocation.isEmpty ||
      orderedItems.isEmpty ||
      technician.isEmpty ||
      date.isEmpty ||
      traveltime.isEmpty ||
      technicianSignature.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('All input fields are required'),
      ),
    );
    return; // Exit the function
  }

  final pdf = pw.Document();
  final logo = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cool-matic-app-096hqp/assets/zu2ljtrfmrvf/coolmatics_app_icon.png');
  final signature = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cool-matic-app-096hqp/assets/0rudq3cqywd2/signature.png');

  final managementSignature = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cool-matic-app-096hqp/assets/0rudq3cqywd2/signature.png');

  final sign = await networkImage(technicianSignature);
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
                'PURCHASE ORDER',
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
            // Company details
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Coolmatics CC',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('coolmatics@gmail.com / cbrits@coolmatics.co.za'),
                    pw.Text('31 Adelaide Place Lakeside 2'),
                    pw.Text('Kempton Park PO Box 7596, Birchleigh, 1621'),
                    pw.Text('Telephone: 083 274 8305'),
                  ],
                ),
                pw.Container(
                  width: 100,
                  height: 100,
                  child: pw.Image(logo),
                ),
              ],
            ),
            pw.SizedBox(height: 16),
            // Divider
            pw.Divider(
                thickness: 2,
                color: PdfColor.fromHex("#000000")), // Horizontal line
            pw.SizedBox(height: 16),
            // Order details
            pw.Text(
              'Order Details',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 16),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      'Order Number: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(orderNumber.toString()),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      'Supplier: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(supplier),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      'Site Area: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(siteArea),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      'Site Address: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(siteLocation),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 16),
            // Ordered Items
            pw.Text(
              'Ordered Items',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 16),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: orderedItems.map((item) => pw.Text(item)).toList(),
            ),
            pw.SizedBox(height: 16),
            // Technician Details
            pw.Text(
              'Technician Details',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 16),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Technician: $technician'),
                pw.Text('Date: $date'),
              ],
            ),
            pw.SizedBox(height: 16),
            pw.Text('Travel Time: $traveltime'),
            pw.SizedBox(height: 16),
            // Signatures
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(sign),
                pw.Image(managementSignature),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  // Save PDF locally
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
}
