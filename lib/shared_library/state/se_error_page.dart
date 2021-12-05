import 'package:flutter/material.dart';

class SEErrorPage extends StatelessWidget {
  const SEErrorPage({
    Key? key,
    required this.message,
    this.onRefresh,
  }) : super(key: key);
  final String message;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: onRefresh,
            child: const Icon(Icons.refresh),
          ),
          Text(message),
          const Text('Try Refresh')
        ],
      ),
    );
  }
}
