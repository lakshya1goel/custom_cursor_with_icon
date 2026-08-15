import 'package:flutter_test/flutter_test.dart';
import 'package:custom_cursor_with_icon_example/main.dart';

void main() {
  testWidgets('Example app renders all sections', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());
    await tester.pump();

    expect(find.text('Custom Cursor TextField'), findsOneWidget);
    expect(find.text('@ Symbol Cursor'), findsOneWidget);
    expect(find.text('Image Cursor'), findsOneWidget);
    expect(find.text('Lottie Animation Cursor'), findsOneWidget);
    expect(find.text('Borderless Input'), findsOneWidget);
  });
}
