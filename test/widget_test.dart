import 'package:flutter_test/flutter_test.dart';

import 'package:kyc_platform/main.dart';

void main() {
  testWidgets('App launches and shows the KYC checklist screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const KycApp());

    expect(find.text('About you'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });
}
