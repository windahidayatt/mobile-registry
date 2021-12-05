import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/management_report/ui/report/controller/report_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final ReportController _controller = sl();

  @override
  void initState() {
    _controller.getReportData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Report Page'),
      ),
    );
  }
}
