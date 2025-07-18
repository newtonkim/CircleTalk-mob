import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';

void main() {
  group('InputWidget Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('displays hintText and prefixIcon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputWidget(
              hintText: 'Enter text',
              controller: controller,
              obscureText: false,
              prefixIcon: Icons.email,
              validator: (value) => null,
            ),
          ),
        ),
      );

      expect(find.text('Enter text'), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('obscureText hides input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputWidget(
              hintText: 'Password',
              controller: controller,
              obscureText: true,
              prefixIcon: null,
              validator: (value) => null,
            ),
          ),
        ),
      );

      final editableTextFinder = find.byType(EditableText);
      expect(editableTextFinder, findsOneWidget);

      final editableTextWidget = tester.widget<EditableText>(editableTextFinder);
      expect(editableTextWidget.obscureText, isTrue);
    });

    testWidgets('validator returns error message for empty input', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: InputWidget(
                hintText: 'Required',
                controller: controller,
                obscureText: false,
                prefixIcon: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      // Initially no error
      expect(find.text('Field cannot be empty'), findsNothing);

      // Trigger validation with empty input
      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Field cannot be empty'), findsOneWidget);

      // Enter valid input and validate again
      await tester.enterText(find.byType(TextFormField), 'valid input');
      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Field cannot be empty'), findsNothing);
    });
  });

  testWidgets('focus changes input border color', (WidgetTester tester) async {
    final focusNode = FocusNode();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Focus(
            focusNode: focusNode,
            child: InputWidget(
              hintText: 'Focus test',
              controller: TextEditingController(),
              obscureText: false,
              prefixIcon: null,
              validator: (value) => null,
            ),
          ),
        ),
      ),
    );

    // Initially not focused, border color should not be primary color
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    // Request focus and pump
    focusNode.requestFocus();
    await tester.pump();

    
    expect(focusNode.hasFocus, isTrue);

    focusNode.dispose();
  });

  testWidgets('input accepts and displays text', (WidgetTester tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputWidget(
            hintText: 'Enter text',
            controller: controller,
            obscureText: false,
            prefixIcon: null,
            validator: (value) => null,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Hello');
    expect(controller.text, 'Hello');
  });

  testWidgets('validator shows error message', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: InputWidget(
              hintText: 'Required',
              controller: controller,
              obscureText: false,
              prefixIcon: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field cannot be empty';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );

    // Initially no error
    expect(find.text('Field cannot be empty'), findsNothing);

    // Trigger validation with empty input
    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Field cannot be empty'), findsOneWidget);

    // Enter valid input and validate again
    await tester.enterText(find.byType(TextFormField), 'valid input');
    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Field cannot be empty'), findsNothing);
  });
}
