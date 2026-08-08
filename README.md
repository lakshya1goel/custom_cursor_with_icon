# custom_cursor_with_icon

A Flutter TextField widget with an animated cursor that displays a customizable icon below the caret.

Replace Flutter's default blinking cursor with a fully customizable cursor line and any widget as the cursor icon -- perfect for branded text fields, creative UIs, or playful input experiences.

## Features

- Animated blinking cursor with configurable duration
- Any widget as the cursor icon (icons, images, custom shapes)
- Customizable cursor line (color, width, height, glow/shadow)
- Smart overflow handling with fade effect when text scrolls
- Hint text with custom styling
- Input formatters, keyboard types, obscure text support
- Works with or without an external `TextEditingController` and `FocusNode`
- Zero required parameters -- works out of the box with sensible defaults

## Preview

```
  Hello world|
             *
```

The `|` is the animated cursor line, and `*` is your custom icon widget.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  custom_cursor_with_icon: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';

// Minimal -- works with zero configuration
CustomCursorTextField()

// With a custom icon
CustomCursorTextField(
  icon: Icon(Icons.edit, size: 12, color: Colors.blue),
  cursorColor: Colors.blue,
  hint: 'Type something...',
)
```

## Usage Examples

### Basic text field with hint

```dart
CustomCursorTextField(
  hint: 'Enter your name',
  hintStyle: TextStyle(color: Colors.grey),
  onChanged: (value) => print(value),
)
```

### Styled cursor with glow effect

```dart
CustomCursorTextField(
  cursorColor: Colors.blue,
  cursorWidth: 2.5,
  cursorHeightRatio: 0.9,
  cursorBoxShadow: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: 0.6),
      blurRadius: 8,
      spreadRadius: 2,
    ),
  ],
  icon: Icon(Icons.auto_awesome, size: 14, color: Colors.blue),
  iconSize: 14,
  iconGap: 6,
)
```

### Custom icon size and gap

```dart
CustomCursorTextField(
  iconSize: 16,
  iconGap: 8,
  icon: Icon(Icons.star, size: 16, color: Colors.amber),
)
```

### Blink only when focused

```dart
CustomCursorTextField(
  shouldBlinkAlways: false,
  unfocusOnTapOutside: true,
  blinkDuration: Duration(milliseconds: 300),
)
```

### With input formatting

```dart
CustomCursorTextField(
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  keyboardType: TextInputType.number,
  suffixIcon: Icon(Icons.pin),
)
```

### Password field

```dart
CustomCursorTextField(
  obscureText: true,
  obscuringCharacter: '\u2022',
  hint: 'Enter password',
  icon: Icon(Icons.lock, size: 12, color: Colors.indigo),
)
```

### Any widget as cursor icon

```dart
CustomCursorTextField(
  iconSize: 14,
  icon: Container(
    width: 14,
    height: 14,
    decoration: BoxDecoration(
      color: Colors.pink,
      shape: BoxShape.circle,
    ),
  ),
)
```

### With external controller

```dart
final _controller = TextEditingController();

CustomCursorTextField(
  controller: _controller,
  onChanged: (value) => setState(() {}),
)
```

### Full InputDecoration override

```dart
CustomCursorTextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Email',
    prefixIcon: Icon(Icons.email),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
)
```

## API Reference

### CustomCursorTextField

| Parameter | Type | Default | Description |
|---|---|---|---|
| `controller` | `TextEditingController?` | auto-created | Controls the text being edited |
| `style` | `TextStyle?` | theme default | Text style for the input |
| `cursorColor` | `Color?` | `Theme.colorScheme.primary` | Color of the cursor line |
| `icon` | `Widget?` | dropdown arrow | Widget displayed below the cursor |
| `iconSize` | `double` | `12.0` | Size constraint for the icon |
| `iconGap` | `double` | `4.0` | Gap between cursor line and icon |
| `cursorWidth` | `double` | `1.0` | Width of the cursor line |
| `cursorHeightRatio` | `double` | `0.75` | Cursor height as ratio of text height |
| `cursorBoxShadow` | `List<BoxShadow>?` | none | Shadow/glow for the cursor line |
| `blinkDuration` | `Duration` | `500ms` | Half-cycle of the blink animation |
| `shouldBlinkAlways` | `bool` | `true` | Blink even when unfocused |
| `hint` | `String?` | none | Hint text when field is empty |
| `hintStyle` | `TextStyle?` | grey version of style | Style for hint text |
| `contentPadding` | `EdgeInsetsGeometry?` | `EdgeInsets.all(12)` | Padding inside the field |
| `suffixIcon` | `Widget?` | none | Widget at the end of the field |
| `focusNode` | `FocusNode?` | auto-created | Focus control |
| `autofocus` | `bool` | `false` | Auto-focus on mount |
| `onChanged` | `ValueChanged<String>?` | none | Called on text change |
| `onSubmitted` | `ValueChanged<String>?` | none | Called on submit |
| `onTap` | `VoidCallback?` | none | Called on tap |
| `onEditingComplete` | `VoidCallback?` | none | Called when done editing |
| `inputFormatters` | `List<TextInputFormatter>?` | none | Input validation/formatting |
| `keyboardType` | `TextInputType?` | none | Keyboard type |
| `textInputAction` | `TextInputAction?` | none | Keyboard action button |
| `textAlign` | `TextAlign` | `start` | Text alignment |
| `textCapitalization` | `TextCapitalization` | `none` | Auto-capitalization |
| `maxLines` | `int?` | `1` | Maximum lines |
| `minLines` | `int?` | none | Minimum lines |
| `maxLength` | `int?` | none | Maximum characters |
| `obscureText` | `bool` | `false` | Hide text (passwords) |
| `obscuringCharacter` | `String` | `'*'` | Character for obscured text |
| `readOnly` | `bool` | `false` | Prevent editing |
| `enabled` | `bool?` | `true` | Enable/disable the field |
| `enablePaste` | `bool` | `false` | Show paste in selection toolbar |
| `unfocusOnTapOutside` | `bool` | `false` | Unfocus on outside tap |
| `decoration` | `InputDecoration?` | auto-built | Full decoration override |
| `overflowFadeWidth` | `double?` | horizontal padding | Width of overflow fade |
| `overflowFadeGradient` | `LinearGradient?` | transparent-to-black | Custom overflow gradient |
| `selectionControls` | `TextSelectionControls?` | none | Custom selection controls |

## Running the Example

```bash
cd example
flutter run
```

## License

MIT License. See [LICENSE](LICENSE) for details.
