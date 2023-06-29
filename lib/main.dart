import 'package:flutter/material.dart';
import 'package:printer_1/views/screens/AddcomplaintList.dart';
import 'package:printer_1/views/screens/complait.dart';
import 'package:printer_1/views/screens/datelist.dart';
import 'package:printer_1/views/screens/eye-page.dart';
import 'package:printer_1/views/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'EyePage' : (context) => EyePage(),
        'Complaint' : (context) => Complaint(),
        'AddComplaintList' : (context) => AddComplaintList(),
      },
    ),
  );
}