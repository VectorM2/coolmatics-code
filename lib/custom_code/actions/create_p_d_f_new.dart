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

Future<void> createPDFNew(
  BuildContext context,
  String customer,
  String address,
  String description,
  String totalAmount,
  String bank,
  String accountHolder,
  String branchCode,
  String accountNumber,
) async {
  // Input validation
  if (customer.isEmpty ||
      address.isEmpty ||
      description.isEmpty ||
      totalAmount.isEmpty ||
      bank.isEmpty ||
      accountHolder.isEmpty ||
      branchCode.isEmpty ||
      accountNumber.isEmpty) {
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
                'INVOICE',
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
            // Customer details
            pw.Text(
              'Customer Details',
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 16),
            pw.Table.fromTextArray(
              context: context,
              border: pw.TableBorder.all(
                  width: 1, color: PdfColor.fromHex("#000000")), // Table border
              cellAlignment: pw.Alignment.centerLeft,
              headerAlignment: pw.Alignment.center,
              cellStyle: pw.TextStyle(color: PdfColor.fromHex("#000000")),
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex("#000000")),
              data: [
                ['Customer Name', 'Address', 'Description', 'Total Amount'],
                [customer, address, description, totalAmount],
              ],
            ),
            pw.SizedBox(height: 16),
            // Banking Details
            pw.Text(
              'Banking Details',
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 16),
            pw.Table.fromTextArray(
              context: context,
              border: pw.TableBorder.all(
                  width: 1, color: PdfColor.fromHex("#000000")), // Table border
              cellAlignment: pw.Alignment.centerLeft,
              headerAlignment: pw.Alignment.center,
              cellStyle: pw.TextStyle(color: PdfColor.fromHex("#000000")),
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex("#000000")),
              data: [
                ['Bank', 'Account Holder', 'Branch Code', 'Account Number'],
                [bank, accountHolder, branchCode, accountNumber],
              ],
            ),
            pw.SizedBox(height: 16),

            pw.SizedBox(height: 16),
            pw.Text('Date issued:'),
            pw.Text(DateFormat('yyyy-MM-dd').format(DateTime.now())),
            pw.SizedBox(height: 16),
            pw.Divider(
                thickness: 2,
                color: PdfColor.fromHex("#000000")), // Horizontal line
            pw.SizedBox(height: 16),
            // Total Amount
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total Amount:',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  totalAmount,
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 16),
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
