import 'package:flutter/material.dart';

/// TV1 + TV4: hồ sơ, khóa app, thông báo, dark mode, ngôn ngữ, xóa tài khoản.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài đặt')),
      body: const Center(child: Text('Đang xây dựng')),
    );
  }
}
