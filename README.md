# custom_cursor_with_icon

[![pub package](https://img.shields.io/pub/v/custom_cursor_with_icon.svg)](https://pub.dev/packages/custom_cursor_with_icon)
[![pub points](https://img.shields.io/pub/points/custom_cursor_with_icon)](https://pub.dev/packages/custom_cursor_with_icon/score)
[![likes](https://img.shields.io/pub/likes/custom_cursor_with_icon)](https://pub.dev/packages/custom_cursor_with_icon/score)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Flutter `TextField` widget with an animated cursor that displays a customizable icon below the caret. Replace Flutter's default cursor with a fully customizable cursor line and any widget as the cursor icon -- perfect for branded text fields, creative UIs, or playful input experiences.

## Preview

<p align="center">
  <img src="https://raw.githubusercontent.com/lakshya1goel/custom_cursor_with_icon/main/assets/preview.png" alt="Custom Cursor TextField Preview" width="350"/>
</p>

## Features

- Animated blinking cursor with configurable duration
- Any widget as the cursor icon (icons, images, Lottie animations, custom shapes)
- Customizable cursor line (color, width, height, glow/shadow)
- Smart overflow handling with fade effect when text scrolls
- Hint text with custom styling and offset
- Input formatters, keyboard types, obscure text support
- Works with or without an external `TextEditingController` and `FocusNode`
- Control cursor visibility when unfocused via `showCursorWhenUnfocused`
- Zero required parameters -- works out of the box with sensible defaults

## Getting Started

### 1. Add dependency

```yaml
dependencies:
  custom_cursor_with_icon: ^1.0.0
```

### 2. Install

```bash
flutter pub get
```

### 3. Import

```dart
import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';
```

## Usage

### Minimal (zero config)

```dart
const CustomCursorTextField()
```

### With hint and custom icon

```dart
CustomCursorTextField(
  hint: 'Type something...',
  icon: Icon(Icons.edit, size: 12, color: Colors.blue),
  cursorColor: Colors.blue,
  onChanged: (value) => print(value),
)
```

### Glow cursor with shadow

```dart
CustomCursorTextField(
  cursorColor: Colors.blue,
  cursorWidth: 2.0,
  cursorBoxShadow: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: 0.6),
      blurRadius: 8,
      spreadRadius: 2,
    ),
  ],
  icon: Icon(Icons.auto_awesome, size: 12, color: Colors.blue),
)
```

### Always-visible cursor (even when unfocused)

```dart
CustomCursorTextField(
  showCursorWhenUnfocused: true,
  cursorColor: Colors.green,
  icon: Icon(Icons.fiber_manual_record, size: 8, color: Colors.green),
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

| Parameter | Type | Default | Description |
|---|---|---|---|
| `controller` | `TextEditingController?` | auto-created | Controls the text being edited |
| `style` | `TextStyle?` | theme default | Text style for the input |
| `cursorColor` | `Color?` | `Theme.colorScheme.primary` | Color of the cursor line |
| `icon` | `Widget?` | dropdown arrow | Widget displayed below the cursor |
| `iconSize` | `double` | `12.0` | Size constraint for the icon |
| `iconGap` | `double` | `4.0` | Gap between cursor line and icon |
| `iconTopOffset` | `double` | `0.0` | Extra vertical offset for the icon |
| `iconLeftOffset` | `double` | `0.0` | Extra horizontal offset for the icon |
| `cursorWidth` | `double` | `1.0` | Width of the cursor line |
| `cursorHeightRatio` | `double` | `0.75` | Cursor height as ratio of text height |
| `cursorBoxShadow` | `List<BoxShadow>?` | none | Shadow/glow for the cursor line |
| `blinkDuration` | `Duration` | `500ms` | Half-cycle of the blink animation |
| `shouldBlinkAlways` | `bool` | `true` | Blink even when unfocused |
| `showCursorWhenUnfocused` | `bool` | `false` | Show cursor and icon when unfocused |
| `hint` | `String?` | none | Hint text when field is empty |
| `hintStyle` | `TextStyle?` | grey version of style | Style for hint text |
| `hintLeftOffset` | `double` | `0.0` | Extra horizontal offset for hint text |
| `contentPadding` | `EdgeInsetsGeometry?` | `EdgeInsets.all(12)` | Padding inside the field |
| `suffixIcon` | `Widget?` | none | Widget at the end of the field |
| `decoration` | `InputDecoration?` | auto-built | Full decoration override |
| `focusNode` | `FocusNode?` | auto-created | Focus control |
| `autofocus` | `bool` | `false` | Auto-focus on mount |
| `onChanged` | `ValueChanged<String>?` | none | Called on text change |
| `onSubmitted` | `ValueChanged<String>?` | none | Called on submit |
| `onEditingComplete` | `VoidCallback?` | none | Called on editing complete |
| `onTap` | `VoidCallback?` | none | Called on tap |
| `inputFormatters` | `List<TextInputFormatter>?` | none | Input validation/formatting |
| `keyboardType` | `TextInputType?` | none | Keyboard type |
| `textInputAction` | `TextInputAction?` | none | Keyboard action button |
| `textAlign` | `TextAlign` | `start` | Text alignment |
| `textCapitalization` | `TextCapitalization` | `none` | Text capitalization behavior |
| `maxLines` | `int?` | `1` | Maximum lines |
| `minLines` | `int?` | none | Minimum lines |
| `maxLength` | `int?` | none | Maximum characters |
| `obscureText` | `bool` | `false` | Hide text (passwords) |
| `obscuringCharacter` | `String` | `'*'` | Character for obscured text |
| `readOnly` | `bool` | `false` | Prevent editing |
| `enabled` | `bool?` | `true` | Enable/disable the field |
| `enablePaste` | `bool` | `false` | Show paste in selection toolbar |
| `selectionControls` | `TextSelectionControls?` | none | Custom selection controls |
| `unfocusOnTapOutside` | `bool` | `false` | Unfocus on outside tap |
| `unfocusOnKeyboardDismiss` | `bool` | `false` | Unfocus when keyboard dismissed |
| `overflowFadeWidth` | `double?` | horizontal padding | Width of overflow fade |
| `overflowFadeGradient` | `LinearGradient?` | transparent-to-black | Custom overflow gradient |

## Migration from 0.1.0

The cursor is now **hidden when unfocused** by default. If you relied on the cursor being visible at all times, add:

```dart
CustomCursorTextField(
  showCursorWhenUnfocused: true,
  // ... your other parameters
)
```

## Running the Example

```bash
cd example
flutter run
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on [GitHub](https://github.com/lakshya1goel/custom_cursor_with_icon).

## License

MIT License. See [LICENSE](LICENSE) for details.
