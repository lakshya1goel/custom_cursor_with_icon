import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';

Widget buildTestApp({required Widget child}) {
  return MaterialApp(home: Scaffold(body: child));
}

/// Pumps enough frames for the widget to render and post-frame callbacks to run,
/// without waiting for animations to settle (the cursor blink never settles).
Future<void> pumpFrames(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 50));
}

void main() {
  group('CustomCursorTextField', () {
    testWidgets('renders with zero configuration', (tester) async {
      await tester.pumpWidget(
        buildTestApp(child: const CustomCursorTextField()),
      );
      await pumpFrames(tester);

      expect(find.byType(CustomCursorTextField), findsOneWidget);
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('displays hint text when empty', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(hint: 'Enter text'),
        ),
      );
      await pumpFrames(tester);

      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('hides hint text when controller has text', (tester) async {
      final controller = TextEditingController(text: 'hello');
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(
            controller: controller,
            hint: 'Enter text',
          ),
        ),
      );
      await pumpFrames(tester);

      expect(find.text('Enter text'), findsNothing);
      expect(find.text('hello'), findsOneWidget);
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);

      String? changedValue;

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(
            controller: controller,
            onChanged: (value) => changedValue = value,
          ),
        ),
      );
      await pumpFrames(tester);

      await tester.enterText(find.byType(TextField).first, 'test');
      await pumpFrames(tester);

      expect(controller.text, 'test');
      expect(changedValue, 'test');
    });

    testWidgets('uses custom cursor color', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(
            cursorColor: Colors.red,
          ),
        ),
      );
      await pumpFrames(tester);

      expect(find.byType(CustomCursorTextField), findsOneWidget);
    });

    testWidgets('displays custom icon when focused', (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(
            focusNode: focusNode,
            icon: const Icon(Icons.edit, size: 12),
          ),
        ),
      );
      await pumpFrames(tester);

      focusNode.requestFocus();
      await pumpFrames(tester);

      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('displays default icon when focused and none provided',
        (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(focusNode: focusNode),
        ),
      );
      await pumpFrames(tester);

      focusNode.requestFocus();
      await pumpFrames(tester);

      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });

    testWidgets('displays suffix icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(
            suffixIcon: Icon(Icons.search),
          ),
        ),
      );
      await pumpFrames(tester);

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('applies input formatters', (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(
            controller: controller,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      );
      await pumpFrames(tester);

      await tester.enterText(find.byType(TextField).first, 'abc123');
      await pumpFrames(tester);

      expect(controller.text, '123');
    });

    testWidgets('respects autofocus', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(autofocus: true),
        ),
      );
      await pumpFrames(tester);

      final textField =
          tester.widget<TextField>(find.byType(TextField).first);
      expect(textField.autofocus, isTrue);
    });

    testWidgets('uses external focus node', (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        buildTestApp(
          child: CustomCursorTextField(focusNode: focusNode),
        ),
      );
      await pumpFrames(tester);

      focusNode.requestFocus();
      await pumpFrames(tester);

      expect(focusNode.hasFocus, isTrue);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(
            obscureText: true,
            obscuringCharacter: '\u2022',
          ),
        ),
      );
      await pumpFrames(tester);

      final textField =
          tester.widget<TextField>(find.byType(TextField).first);
      expect(textField.obscureText, isTrue);
      expect(textField.obscuringCharacter, '\u2022');
    });

    testWidgets('readOnly prevents editing', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(readOnly: true),
        ),
      );
      await pumpFrames(tester);

      final textField =
          tester.widget<TextField>(find.byType(TextField).first);
      expect(textField.readOnly, isTrue);
    });

    testWidgets('disposes internal controller when no external one',
        (tester) async {
      await tester.pumpWidget(
        buildTestApp(child: const CustomCursorTextField()),
      );
      await pumpFrames(tester);

      // Remove the widget - should dispose without errors
      await tester.pumpWidget(buildTestApp(child: const SizedBox()));
      await pumpFrames(tester);
    });

    testWidgets('uses custom content padding', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      );
      await pumpFrames(tester);

      expect(find.byType(CustomCursorTextField), findsOneWidget);
    });

    testWidgets('renders with custom blinkDuration', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(
            blinkDuration: Duration(milliseconds: 200),
          ),
        ),
      );
      await pumpFrames(tester);

      expect(find.byType(CustomCursorTextField), findsOneWidget);
    });

    testWidgets('cursor is hidden when unfocused', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          child: const CustomCursorTextField(),
        ),
      );
      await pumpFrames(tester);

      // No cursor icon should be visible when unfocused
      expect(find.byIcon(Icons.arrow_drop_down), findsNothing);
    });
  });
}
