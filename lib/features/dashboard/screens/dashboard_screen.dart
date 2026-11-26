import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';

/// TV3: dashboard tài sản ròng, biểu đồ, báo cáo (CN15–18).
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tổng quan')),
      body: Center(
        child: Text(
          'Tài sản ròng: ${formatVnd(0)}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
