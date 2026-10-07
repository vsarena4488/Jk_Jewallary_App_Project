import 'package:flutter_test/flutter_test.dart';

import 'package:jk_jewallary_project/main.dart';

void main() {
  testWidgets('login opens the admin dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('LOGIN'), findsNWidgets(2));

    await tester.tap(find.text('LOGIN').last);
    await tester.pumpAndSettle();

    expect(find.text('DASHBOARD'), findsOneWidget);
  });
}
