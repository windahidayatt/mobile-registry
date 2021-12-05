import 'package:flutter/material.dart';

class PatientDataPage extends StatefulWidget {
  const PatientDataPage({Key? key}) : super(key: key);

  @override
  _PatientDataPageState createState() => _PatientDataPageState();
}

class _PatientDataPageState extends State<PatientDataPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Patient Data Page'),
      ),
    );
  }
}
