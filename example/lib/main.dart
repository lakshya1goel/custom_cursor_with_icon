import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Cursor TextField Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0E0E0E),
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
  final _atSymbolController = TextEditingController();
  final _imageController = TextEditingController();
  final _lottieController = TextEditingController();
  final _borderlessController = TextEditingController();
  final _neonController = TextEditingController();
  final _alwaysVisibleController = TextEditingController();

  @override
  void dispose() {
    _atSymbolController.dispose();
    _imageController.dispose();
    _lottieController.dispose();
    _borderlessController.dispose();
    _neonController.dispose();
    _alwaysVisibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Cursor TextField'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. @ Icon Symbol ──
            _sectionTitle('@ Symbol Cursor'),
            _card(
              child: CustomCursorTextField(
                controller: _atSymbolController,
                hint: 'Enter username',
                cursorColor: const Color(0xFF1DA1F2),
                cursorHeightRatio: 0.7,
                iconSize: 14,
                unfocusOnTapOutside: true,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.3),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._]')),
                  LengthLimitingTextInputFormatter(20),
                ],
                icon: const Text(
                  '@',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1DA1F2),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── 2. Image Cursor ──
            _sectionTitle('Image Cursor'),
            _card(
              child: CustomCursorTextField(
                controller: _imageController,
                hint: 'Write a caption...',
                cursorColor: const Color(0xFFE1306C),
                cursorHeightRatio: 0.7,
                iconSize: 18,
                iconGap: 3,
                unfocusOnTapOutside: true,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.3),
                  fontWeight: FontWeight.w400,
                ),
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(
                    'https://i.pravatar.cc/100',
                    width: 18,
                    height: 18,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1306C),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── 3. Lottie Cursor ──
            _sectionTitle('Lottie Animation Cursor'),
            _card(
              child: CustomCursorTextField(
                controller: _lottieController,
                hint: 'Start typing...',
                cursorColor: const Color(0xFFFFD700),
                cursorWidth: 2,
                cursorHeightRatio: 0.65,
                iconSize: 24,
                iconGap: 2,
                iconTopOffset: -2,
                unfocusOnTapOutside: true,
                cursorBoxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withValues(alpha: 0.5),
                    blurRadius: 6,
                  ),
                ],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.4,
                ),
                hintStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.25),
                  height: 1.4,
                ),
                icon: Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_obhph3sh.json',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.star,
                    size: 20,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── 4. Borderless ──
            _sectionTitle('Borderless Input'),
            CustomCursorTextField(
              controller: _borderlessController,
              hint: 'Just start writing…',
              cursorColor: Colors.white,
              cursorHeightRatio: 0.6,
              iconSize: 10,
              shouldBlinkAlways: false,
              unfocusOnTapOutside: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 12,
              ),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 0.5,
                height: 1.3,
              ),
              hintStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white.withValues(alpha: 0.15),
                letterSpacing: 0.5,
                height: 1.3,
              ),
              icon: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),

            const SizedBox(height: 32),

            // ── 5. Text field with suffix ──
            _sectionTitle('Text field with suffix'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.08),
                    Colors.white.withValues(alpha: 0.03),
                  ],
                ),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: CustomCursorTextField(
                controller: _neonController,
                hint: 'Search anything…',
                cursorColor: const Color(0xFFAA66FF),
                cursorWidth: 2,
                cursorHeightRatio: 0.7,
                iconSize: 14,
                iconGap: 3,
                enablePaste: true,
                unfocusOnTapOutside: true,
                cursorBoxShadow: [
                  BoxShadow(
                    color: const Color(0xFFAA66FF).withValues(alpha: 0.6),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.3),
                ),
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.white.withValues(alpha: 0.4),
                ),
                icon: Transform.rotate(
                  angle: 0.785398, // 45 degrees
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFAA66FF), Color(0xFF66CCFF)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── 6. Always Visible Cursor ──
            _sectionTitle('Always Visible Cursor'),
            _card(
              child: CustomCursorTextField(
                controller: _alwaysVisibleController,
                hint: 'Cursor is always here',
                showCursorWhenUnfocused: true,
                cursorColor: const Color(0xFF00E676),
                cursorHeightRatio: 0.7,
                iconSize: 12,
                unfocusOnTapOutside: true,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.3),
                ),
                icon: const Icon(
                  Icons.fiber_manual_record,
                  size: 8,
                  color: Color(0xFF00E676),
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
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: child,
    );
  }
}
