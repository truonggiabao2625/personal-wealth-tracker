import 'package:flutter_test/flutter_test.dart';
import 'package:finvault_mobile/app.dart';

void main() {
  testWidgets('App mở được và có thanh điều hướng', (tester) async {
    await tester.pumpWidget(const FinVaultApp());
    await tester.pumpAndSettle();

    expect(find.text('Tổng quan'), findsWidgets);
    expect(find.text('Tài sản'), findsWidgets);
    expect(find.text('Mục tiêu'), findsWidgets);
    expect(find.text('Cài đặt'), findsWidgets);
  });
}
