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

Future<void> createPDF(
  String customer,
  String address,
  String description,
  String totalAmount,
  String bank,
  String accountHolder,
  String branchCode,
  String accountNumber,
) async {
  final pdf = pw.Document();
  final logo = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cool-matic-app-096hqp/assets/mjd7cxfry2pj/coolmatics_log_dark.png');
  final signature = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cool-matic-app-096hqp/assets/mjd7cxfry2pj/coolmatics_log_dark.png');

  // Build PDF content
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Container(
        padding: pw.EdgeInsets.all(16),
        color: PdfColor.fromHex("#249689"), // Set background color
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header with title and company name
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Invoice',
                  style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex(
                          "#FFFFFF")), // Set text color to white
                ),
                pw.Text(
                  'Coolmatics',
                  style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex(
                          "#FFFFFF")), // Set text color to white
                ),
              ],
            ),
            // Company details
            pw.Text('Email: yourcompany@coolmatics.com',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Address: 123 Coolmatics Street, Coolville',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            // Logo
            pw.Container(
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
              child: pw.Image(logo), // Use loaded image bytes
            ),
            pw.SizedBox(height: 16), // Spacer
            // Customer details
            pw.Text(
              'Customer Details',
              style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color:
                      PdfColor.fromHex("#FFFFFF")), // Set text color to white
            ),
            pw.SizedBox(height: 16),
            pw.Text('Customer Name: $customer',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Address: $address',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Description: $description',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Total Amount: $totalAmount',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.SizedBox(height: 32),
            pw.Text(
              'Banking Details',
              style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color:
                      PdfColor.fromHex("#FFFFFF")), // Set text color to white
            ),
            pw.SizedBox(height: 16),
            pw.Text('Bank: $bank',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Account Holder: $accountHolder',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Branch Code: $branchCode',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Account Number: $accountNumber',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.SizedBox(height: 32),
            pw.Text(
              'Contact Details',
              style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color:
                      PdfColor.fromHex("#FFFFFF")), // Set text color to white
            ),
            pw.SizedBox(height: 16),
            // Add your company's contact details here
            pw.Text('Company Name',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Address',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.Text('Phone Number',
                style: pw.TextStyle(
                    color: PdfColor.fromHex(
                        "#FFFFFF"))), // Set text color to white
            pw.SizedBox(height: 32),
            pw.Image(signature),
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
}
