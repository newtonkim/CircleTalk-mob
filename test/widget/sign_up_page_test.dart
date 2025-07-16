import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:circle_talk_mob/views/widget/sign_up_page.dart';

void main() {
  testWidgets('Snackbar appears when any required field is empty', (WidgetTester tester) async {
    // Build the SignUpPage widget inside a GetMaterialApp to support GetX features
    await tester.pumpWidget(GetMaterialApp(home: SignUpPage()));

    // Tap the Sign Up button without entering any input
    final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
    expect(signUpButton, findsOneWidget);

    await tester.tap(signUpButton);
    await tester.pump(); // Start frame to show snackbar

    // Verify that a snackbar with the error message is shown
    expect(find.text('Please fill all fields correctly'), findsOneWidget);
  });
}
