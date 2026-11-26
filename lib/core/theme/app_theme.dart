import 'package:flutter/material.dart';

/// Màu và kiểu chữ dùng chung cho cả app.
/// Dark mode (CN27) sẽ thêm `dark` ở đây.
class AppTheme {
  AppTheme._();

  static const _seed = Color(0xFF00897B); // xanh ngọc

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _seed),
  );
}
