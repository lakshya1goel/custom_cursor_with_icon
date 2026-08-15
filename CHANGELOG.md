## 1.0.0

* **Breaking:** Cursor and icon are now hidden when the text field is unfocused (previously always visible when `shouldBlinkAlways` was `true`). Set `showCursorWhenUnfocused: true` to restore the old behavior.
* Added `showCursorWhenUnfocused` parameter to control cursor visibility when the field is not focused.
* Added `hintLeftOffset` parameter for fine-tuning hint text horizontal alignment.
* Improved cursor positioning accuracy using a hidden measurement `TextField` for reliable text height calculation.
* Cursor line is now vertically centered within the text line height.
* Optimized rebuild performance — only rebuilds when hint visibility or overflow state actually changes.
* Added 6 example variants: @ symbol, network image, Lottie animation, borderless, glassmorphism with suffix, and always-visible cursor.

## 0.1.0

* Initial release.
* `CustomCursorTextField` widget with animated cursor and icon.
* Fully customizable cursor appearance (color, width, height ratio, box shadow).
* Configurable icon size and gap between cursor line and icon.
* Blink duration and behavior control (always blink vs. only when focused).
* Support for hint text, suffix icon, input formatters, and keyboard type.
* Overflow fade effect when text exceeds visible area.
* Paste control and tap-outside unfocus behavior.
* Full `InputDecoration` override support.
