import 'package:intl/intl.dart';

final _vnd = NumberFormat.currency(
  locale: 'vi_VN',
  symbol: '₫',
  decimalDigits: 0,
);

/// Định dạng tiền Việt: 1500000 -> "1.500.000 ₫".
/// Mọi màn hình hiển thị tiền đều dùng hàm này để thống nhất.
String formatVnd(num amount) => _vnd.format(amount);
