import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Cursor TextField Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _basicController = TextEditingController();
  final _styledController = TextEditingController();
  final _glowController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _basicController.dispose();
    _styledController.dispose();
    _glowController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Cursor TextField'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Minimal (zero config)'),
            _card(
              child: const CustomCursorTextField(),
            ),
            const SizedBox(height: 24),
            _sectionTitle('With hint and custom icon'),
            _card(
              child: CustomCursorTextField(
                controller: _basicController,
                hint: 'Type something...',
                icon: const Icon(
                  Icons.edit,
                  size: 12,
                  color: Colors.deepPurple,
                ),
                cursorColor: Colors.deepPurple,
                onChanged: (value) {
                  debugPrint('Value: $value');
                },
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Styled cursor'),
            _card(
              child: CustomCursorTextField(
                controller: _styledController,
                hint: 'Large cursor, big icon',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
                cursorColor: Colors.teal,
                cursorWidth: 2.5,
                cursorHeightRatio: 0.9,
                iconSize: 16,
                iconGap: 6,
                icon: const Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.teal,
                ),
                blinkDuration: const Duration(milliseconds: 300),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Glow cursor with shadow'),
            _card(
              child: CustomCursorTextField(
                controller: _glowController,
                hint: 'Glowing cursor...',
                cursorColor: Colors.blue,
                cursorWidth: 2,
                cursorBoxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.6),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
                icon: const Icon(
                  Icons.auto_awesome,
                  size: 12,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Blink only when focused'),
            _card(
              child: CustomCursorTextField(
                hint: 'Tap to see cursor blink',
                shouldBlinkAlways: false,
                cursorColor: Colors.orange,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 12,
                  color: Colors.orange,
                ),
                unfocusOnTapOutside: true,
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('With suffix icon and input formatter'),
            _card(
              child: CustomCursorTextField(
                hint: 'Numbers only',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                suffixIcon: const Icon(Icons.pin),
                cursorColor: Colors.red,
                icon: const Icon(
                  Icons.numbers,
                  size: 12,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Password field'),
            _card(
              child: CustomCursorTextField(
                controller: _passwordController,
                hint: 'Enter password',
                obscureText: true,
                obscuringCharacter: '\u2022',
                cursorColor: Colors.indigo,
                icon: const Icon(
                  Icons.lock,
                  size: 12,
                  color: Colors.indigo,
                ),
                suffixIcon: const Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Custom image as icon'),
            _card(
              child: CustomCursorTextField(
                hint: 'Any widget as cursor icon',
                cursorColor: Colors.pink,
                iconSize: 14,
                icon: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: child,
    );
  }
}
