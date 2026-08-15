# custom_cursor_with_icon

[![pub package](https://img.shields.io/pub/v/custom_cursor_with_icon.svg)](https://pub.dev/packages/custom_cursor_with_icon)
[![pub points](https://img.shields.io/pub/points/custom_cursor_with_icon)](https://pub.dev/packages/custom_cursor_with_icon/score)
[![likes](https://img.shields.io/pub/likes/custom_cursor_with_icon)](https://pub.dev/packages/custom_cursor_with_icon/score)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%E2%89%A53.10-02569B?logo=flutter)](https://flutter.dev)

A Flutter `TextField` widget with an animated cursor that displays a **customizable icon below the caret**. Replace Flutter's default cursor with a fully configurable cursor line and any widget as the cursor icon -- perfect for branded text fields, creative UIs, or playful input experiences.

---

## Demo

<p align="center">
  <img src="https://github.com/lakshya1goel/custom_cursor_with_icon/raw/main/assets/preview_image.jpg" alt="Custom Cursor TextField Preview" width="350"/>
</p>

https://github.com/lakshya1goel/custom_cursor_with_icon/raw/main/assets/preview_video.mp4

---

## Features

- **Custom cursor icon** -- use any widget (icons, images, Lottie animations, custom shapes) below the caret
- **Animated blinking** -- configurable blink duration and behavior (always, only when focused, or static)
- **Cursor styling** -- color, width, height ratio, and glow/shadow effects
- **Overflow handling** -- smart fade effect at the left edge when text scrolls
- **Hint text** -- with custom styling and horizontal offset
- **Focus control** -- `showCursorWhenUnfocused` to keep the cursor visible without focus
- **Full TextField API** -- input formatters, keyboard types, obscure text, max length, read-only, and more
- **Zero config** -- works out of the box with sensible defaults, no required parameters

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  custom_cursor_with_icon: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## Quick Start

```dart
import 'package:custom_cursor_with_icon/custom_cursor_with_icon.dart';
```

### Minimal -- zero configuration

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

---

## Examples

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
  iconSize: 18,
  icon: ClipRRect(
    borderRadius: BorderRadius.circular(9),
    child: Image.network('https://i.pravatar.cc/100', width: 18, height: 18),
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

---

## API Reference

### Cursor Appearance

| Parameter | Type | Default | Description |
|---|---|---|---|
| `cursorColor` | `Color?` | `Theme.colorScheme.primary` | Color of the cursor line |
| `cursorWidth` | `double` | `1.0` | Width of the cursor line |
| `cursorHeightRatio` | `double` | `0.75` | Cursor height as a fraction of text height |
| `cursorBoxShadow` | `List<BoxShadow>?` | none | Shadow/glow effect on the cursor line |

### Icon

| Parameter | Type | Default | Description |
|---|---|---|---|
| `icon` | `Widget?` | dropdown arrow | Widget displayed below the cursor |
| `iconSize` | `double` | `12.0` | Width and height constraint for the icon |
| `iconGap` | `double` | `4.0` | Gap between cursor line bottom and icon top |
| `iconTopOffset` | `double` | `0.0` | Additional vertical offset for the icon |
| `iconLeftOffset` | `double` | `0.0` | Additional horizontal offset for the icon |

### Blink Behavior

| Parameter | Type | Default | Description |
|---|---|---|---|
| `blinkDuration` | `Duration` | `500ms` | Half-cycle duration of the blink animation |
| `shouldBlinkAlways` | `bool` | `true` | Whether to blink continuously, even when unfocused |
| `showCursorWhenUnfocused` | `bool` | `false` | Show cursor and icon when the field is not focused |

### Text & Input

| Parameter | Type | Default | Description |
|---|---|---|---|
| `controller` | `TextEditingController?` | auto-created | Controls the text being edited |
| `style` | `TextStyle?` | theme default | Text style for the input |
| `hint` | `String?` | none | Hint text displayed when field is empty |
| `hintStyle` | `TextStyle?` | grey version of style | Style for hint text |
| `hintLeftOffset` | `double` | `0.0` | Extra horizontal offset for hint text |
| `textAlign` | `TextAlign` | `start` | Horizontal text alignment |
| `textCapitalization` | `TextCapitalization` | `none` | Text capitalization behavior |
| `inputFormatters` | `List<TextInputFormatter>?` | none | Input validation and formatting |
| `keyboardType` | `TextInputType?` | none | Keyboard type |
| `textInputAction` | `TextInputAction?` | none | Keyboard action button |
| `maxLines` | `int?` | `1` | Maximum number of lines |
| `minLines` | `int?` | none | Minimum number of lines |
| `maxLength` | `int?` | none | Maximum character count |
| `obscureText` | `bool` | `false` | Whether to hide text (for passwords) |
| `obscuringCharacter` | `String` | `'*'` | Character used when text is obscured |
| `readOnly` | `bool` | `false` | Whether the field is read-only |
| `enabled` | `bool?` | `true` | Whether the field is enabled |

### Layout & Decoration

| Parameter | Type | Default | Description |
|---|---|---|---|
| `contentPadding` | `EdgeInsetsGeometry?` | `EdgeInsets.all(12)` | Padding inside the field |
| `suffixIcon` | `Widget?` | none | Widget at the end of the field |
| `decoration` | `InputDecoration?` | auto-built | Full decoration override |
| `overflowFadeWidth` | `double?` | horizontal padding | Width of the overflow fade effect |
| `overflowFadeGradient` | `LinearGradient?` | transparent → black | Custom overflow gradient |

### Focus & Interaction

| Parameter | Type | Default | Description |
|---|---|---|---|
| `focusNode` | `FocusNode?` | auto-created | Focus control |
| `autofocus` | `bool` | `false` | Auto-focus on mount |
| `unfocusOnTapOutside` | `bool` | `false` | Unfocus when tapping outside |
| `unfocusOnKeyboardDismiss` | `bool` | `false` | Unfocus when keyboard is dismissed |
| `enablePaste` | `bool` | `false` | Show paste option in selection toolbar |
| `selectionControls` | `TextSelectionControls?` | none | Custom text selection controls |

### Callbacks

| Parameter | Type | Default | Description |
|---|---|---|---|
| `onChanged` | `ValueChanged<String>?` | none | Called when text changes |
| `onSubmitted` | `ValueChanged<String>?` | none | Called when user submits |
| `onEditingComplete` | `VoidCallback?` | none | Called when editing is complete |
| `onTap` | `VoidCallback?` | none | Called when field is tapped |

---

## Migration from 0.1.0

The cursor is now **hidden when unfocused** by default. If you relied on the cursor being visible at all times, add:

```dart
CustomCursorTextField(
  showCursorWhenUnfocused: true,
)
```

---

## Running the Example

The example app includes 6 demos: @ symbol icon, network image, Lottie animation, borderless input, glassmorphism with suffix, and always-visible cursor.

```bash
cd example
flutter create .    # generate platform folders if needed
flutter run
```

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on [GitHub](https://github.com/lakshya1goel/custom_cursor_with_icon).

## License

MIT License. See [LICENSE](LICENSE) for details.
