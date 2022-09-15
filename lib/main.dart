import 'package:flutter/material.dart';
import 'package:invoice_generator/homepage.dart';
import 'package:invoice_generator/options/client_page.dart';
import 'package:invoice_generator/options/company_logo_page.dart';
import 'package:invoice_generator/options/invoice_detail_page.dart';
import 'package:invoice_generator/options/items_page.dart';
import 'package:invoice_generator/options/pdf_page.dart';
import 'package:invoice_generator/options/your_detail_page.dart';
import 'package:invoice_generator/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        '/': (context) => HomePage(),
        'splash': (context) => Splashscreen(),
        'company_logo': (context) => Company_Logo(),
        'invoice_detail': (context) => Invoice_Detail(),
        'your_detail': (context) => your_Detail(),
        'client': (context) => Client_Page(),
        'items': (context) => Items(),
        'pdf': (context) => Pdf_Page(),
      },
    ),
  );
}
