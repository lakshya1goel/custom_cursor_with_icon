import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom [TextField] widget with an animated cursor that includes
/// a decorative icon below the caret.
///
/// This widget replaces Flutter's default cursor with a custom-drawn cursor
/// line and an icon widget positioned just below it. The cursor blinks with
/// a configurable animation and tracks the text selection position accurately,
/// even when the text overflows and scrolls.
///
/// {@tool snippet}
/// Basic usage with default settings:
///
/// ```dart
/// CustomCursorTextField(
///   icon: Icon(Icons.star, size: 12, color: Colors.amber),
/// )
/// ```
/// {@end-tool}
///
/// {@tool snippet}
/// Fully customized example:
///
/// ```dart
/// CustomCursorTextField(
///   controller: _controller,
///   icon: Icon(Icons.edit, size: 14, color: Colors.blue),
///   cursorColor: Colors.blue,
///   cursorWidth: 2.0,
///   cursorHeightRatio: 0.8,
///   iconSize: 14,
///   iconGap: 6,
///   blinkDuration: Duration(milliseconds: 600),
///   style: TextStyle(fontSize: 18, color: Colors.black),
///   hint: 'Type something...',
///   hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
///   onChanged: (value) => print(value),
/// )
/// ```
/// {@end-tool}
///
/// All parameters are optional and come with sensible defaults, giving users
/// full control over every aspect of the widget's appearance and behavior.
class CustomCursorTextField extends StatefulWidget {
  /// Creates a [CustomCursorTextField].
  ///
  /// The [icon] is the widget displayed below the cursor caret line.
  /// If not provided, a small downward-pointing triangle is used.
  const CustomCursorTextField({
    super.key,
    this.autofocus = false,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.contentPadding,
    this.controller,
    this.cursorBoxShadow,
    this.cursorColor,
    this.cursorHeightRatio = 0.75,
    this.cursorWidth = 1.0,
    this.decoration,
    this.enabled,
    this.enablePaste = false,
    this.focusNode,
    this.hint,
    this.hintLeftOffset = 0.0,
    this.hintStyle,
    this.icon,
    this.iconGap = 4.0,
    this.iconLeftOffset = 0.0,
    this.iconSize = 12.0,
    this.iconTopOffset = 0.0,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.overflowFadeGradient,
    this.overflowFadeWidth,
    this.readOnly = false,
    this.selectionControls,
    this.shouldBlinkAlways = true,
    this.style,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.unfocusOnKeyboardDismiss = false,
    this.unfocusOnTapOutside = false,
  });

  /// Whether the text field should be focused initially.
  ///
  /// Defaults to `false`.
  final bool autofocus;

  /// The duration of one half of the cursor blink cycle (fade in or fade out).
  ///
  /// The full blink cycle takes `2 * blinkDuration`. A shorter duration makes
  /// the cursor blink faster.
  ///
  /// Defaults to `Duration(milliseconds: 500)`.
  final Duration blinkDuration;

  /// Padding inside the text field around the text content.
  ///
  /// Defaults to `EdgeInsets.all(12.0)`.
  final EdgeInsetsGeometry? contentPadding;

  /// Controls the text being edited.
  ///
  /// If null, an internal [TextEditingController] is created and managed
  /// automatically.
  final TextEditingController? controller;

  /// Box shadow applied to the cursor line for a glow effect.
  ///
  /// ```dart
  /// cursorBoxShadow: [
  ///   BoxShadow(color: Colors.blue.withValues(alpha: 0.5), blurRadius: 4),
  /// ]
  /// ```
  final List<BoxShadow>? cursorBoxShadow;

  /// The color of the cursor line.
  ///
  /// Defaults to [Theme.of(context).colorScheme.primary].
  final Color? cursorColor;

  /// The height of the cursor line as a fraction of the text height.
  ///
  /// A value of `1.0` makes the cursor as tall as the text. Values below `1.0`
  /// make it shorter, values above `1.0` make it taller.
  ///
  /// Defaults to `0.75`.
  final double cursorHeightRatio;

  /// The width of the cursor line in logical pixels.
  ///
  /// Defaults to `1.0`.
  final double cursorWidth;

  /// Full [InputDecoration] override for the underlying [TextField].
  ///
  /// When provided, [hint], [hintStyle], [suffixIcon], and [contentPadding]
  /// are ignored and this decoration is used directly. The caller is
  /// responsible for setting appropriate padding and borders.
  final InputDecoration? decoration;

  /// Whether the text field is enabled.
  final bool? enabled;

  /// Whether to enable the paste option in the text selection toolbar.
  ///
  /// When `false` (default), an [EmptyTextSelectionControls] is used to
  /// suppress the toolbar. When `true`, the platform default is used (or
  /// [selectionControls] if provided).
  final bool enablePaste;

  /// An optional [FocusNode] to use.
  ///
  /// If null, an internal [FocusNode] is created and managed automatically.
  final FocusNode? focusNode;

  /// Optional hint text displayed when the field is empty.
  final String? hint;

  /// Extra horizontal offset applied to the hint text from the left edge,
  /// in logical pixels.
  ///
  /// Useful for nudging the hint text to align with the cursor position.
  ///
  /// Defaults to `0.0`.
  final double hintLeftOffset;

  /// Style for the [hint] text.
  ///
  /// If null, uses the main [style] with reduced opacity.
  final TextStyle? hintStyle;

  /// The widget displayed below the cursor caret line.
  ///
  /// Typically a small [Icon] or [Image]. Its size is constrained by [iconSize].
  ///
  /// If null, a small downward-pointing triangle icon is drawn using the
  /// [cursorColor].
  final Widget? icon;

  /// The gap between the bottom of the cursor line and the top of the [icon],
  /// in logical pixels.
  ///
  /// Defaults to `4.0`.
  final double iconGap;

  /// Additional horizontal offset for the [icon] from its centered position,
  /// in logical pixels.
  ///
  /// Positive values move the icon to the right, negative to the left.
  ///
  /// Defaults to `0.0`.
  final double iconLeftOffset;

  /// The width and height constraint for the [icon] widget.
  ///
  /// Defaults to `12.0`.
  final double iconSize;

  /// Additional vertical offset for the [icon] from its default position
  /// below the cursor line, in logical pixels.
  ///
  /// Positive values move the icon downward, negative upward.
  ///
  /// Defaults to `0.0`.
  final double iconTopOffset;

  /// Optional input formatters that restrict or transform the input.
  final List<TextInputFormatter>? inputFormatters;

  /// The type of keyboard to display for editing the text.
  final TextInputType? keyboardType;

  /// The maximum number of characters allowed.
  final int? maxLength;

  /// The maximum number of lines for the text field.
  ///
  /// Defaults to `1` (single-line).
  final int? maxLines;

  /// The minimum number of lines for the text field.
  final int? minLines;

  /// Whether to obscure the text (e.g. for passwords).
  ///
  /// Defaults to `false`.
  final bool obscureText;

  /// The character used to obscure text when [obscureText] is true.
  ///
  /// Defaults to `'*'`.
  final String obscuringCharacter;

  /// Called when the user changes the text in the field.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates they are done editing.
  final VoidCallback? onEditingComplete;

  /// Called when the user submits the text (e.g. presses done on the keyboard).
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field is tapped.
  final VoidCallback? onTap;

  /// Custom gradient for the overflow fade effect.
  ///
  /// If null, a default left-to-right transparent-to-black gradient is used.
  final LinearGradient? overflowFadeGradient;

  /// The width of the overflow fade effect at the left edge when text scrolls.
  ///
  /// Defaults to the horizontal content padding value.
  final double? overflowFadeWidth;

  /// Whether the text field is read-only.
  ///
  /// Defaults to `false`.
  final bool readOnly;

  /// Custom [TextSelectionControls] for the text field.
  ///
  /// Only used when [enablePaste] is `true`. When [enablePaste] is `false`,
  /// an [EmptyTextSelectionControls] is always used regardless of this value.
  final TextSelectionControls? selectionControls;

  /// Whether the cursor should blink at all times, even when unfocused.
  ///
  /// When `true` (default), the cursor blinks continuously.
  /// When `false`, the cursor only blinks while the text field has focus,
  /// and stays fully visible when unfocused.
  final bool shouldBlinkAlways;

  /// The style to use for the text being edited.
  ///
  /// Defaults to the current [TextTheme.bodyLarge] from the ambient [Theme].
  final TextStyle? style;

  /// An optional widget placed at the end of the text field (suffix position).
  final Widget? suffixIcon;

  /// How the text should be aligned horizontally.
  ///
  /// Defaults to [TextAlign.start].
  final TextAlign textAlign;

  /// Configures how the platform keyboard will capitalize text.
  ///
  /// Defaults to [TextCapitalization.none].
  final TextCapitalization textCapitalization;

  /// The action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// Whether to unfocus the text field when the keyboard is dismissed.
  ///
  /// When `true`, the text field will lose focus if the keyboard is closed
  /// (e.g. by the system back button or gesture) while the field is focused.
  ///
  /// Defaults to `false`.
  final bool unfocusOnKeyboardDismiss;

  /// Whether tapping outside the text field should unfocus it.
  ///
  /// Defaults to `false`.
  final bool unfocusOnTapOutside;

  @override
  State<CustomCursorTextField> createState() => _CustomCursorTextFieldState();
}

class _CustomCursorTextFieldState extends State<CustomCursorTextField>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _cursorBlinkController;
  late final AnimationController _cursorPositionController;

  final _measurementController = TextEditingController();

  TextEditingController? _internalController;
  TextEditingController get _effectiveController =>
      widget.controller ?? (_internalController ??= TextEditingController());

  late FocusNode _focusNode;
  bool get _ownsController => widget.controller == null;
  bool get _ownsFocusNode => widget.focusNode == null;

  final _scrollController = ScrollController();

  VoidCallback? _focusListener;
  VoidCallback? _textListener;
  VoidCallback? _scrollListener;

  final _textFieldKey = GlobalKey();
  final _measurementFieldKey = GlobalKey();

  Size _measurementSize = const Size(0, 0);
  bool _isCursorVisible = true;
  bool _wasKeyboardVisible = false;

  EdgeInsetsGeometry get _effectivePadding =>
      widget.contentPadding ?? const EdgeInsets.all(12.0);

  double get _horizontalPadding {
    final padding = _effectivePadding;
    if (padding is EdgeInsets) {
      return padding.left;
    } else if (padding is EdgeInsetsDirectional) {
      return padding.start;
    }
    return 12.0;
  }

  void _updateCursorPosition({bool rerender = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final textFieldBox =
          _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
      final measurementBox =
          _measurementFieldKey.currentContext?.findRenderObject() as RenderBox?;
      if (textFieldBox == null || measurementBox == null) return;

      _measurementSize = measurementBox.size;

      final scrollOffset = _scrollController.hasClients
          ? _scrollController.offset
          : 0.0;

      final textWidthToCursor = measurementBox.size.width;
      final maxVisibleWidth =
          textFieldBox.constraints.maxWidth - (2 * _horizontalPadding);

      double cursorX;
      bool shouldShowCursor = true;

      final isCursorAtEnd =
          _effectiveController.selection.base.offset ==
          _effectiveController.text.length;
      final isTextOverflowing = textWidthToCursor > maxVisibleWidth;

      if (isCursorAtEnd && isTextOverflowing) {
        cursorX = maxVisibleWidth;
        shouldShowCursor = true;
      } else {
        cursorX = textWidthToCursor - scrollOffset;
        shouldShowCursor = cursorX >= 0 && cursorX <= maxVisibleWidth;
        cursorX = max(cursorX, 0.0);
        cursorX = min(cursorX, maxVisibleWidth);
      }

      if (_isCursorVisible != shouldShowCursor) {
        _isCursorVisible = shouldShowCursor;
        setState(() {});
      }

      _cursorPositionController.value = cursorX;

      if (rerender) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initFocusNode();
    _initAnimationControllers();
    _setupFocusListener();
    _setupTextListener();
    _setupScrollListener();
    _updateCursorPosition(rerender: true);
  }

  @override
  void didChangeMetrics() {
    if (!widget.unfocusOnKeyboardDismiss) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final isKeyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
      if (_wasKeyboardVisible && !isKeyboardVisible && _focusNode.hasFocus) {
        _focusNode.unfocus();
      }
      _wasKeyboardVisible = isKeyboardVisible;
    });
  }

  void _initFocusNode() {
    _focusNode = widget.focusNode ?? FocusNode();
  }

  void _initAnimationControllers() {
    _cursorBlinkController = AnimationController(
      duration: widget.blinkDuration,
      vsync: this,
    );

    if (widget.shouldBlinkAlways) {
      _cursorBlinkController.repeat(reverse: true);
    }

    _cursorPositionController = AnimationController.unbounded(vsync: this);
  }

  void _setupFocusListener() {
    _focusListener = () {
      if (!mounted) return;
      if (!widget.shouldBlinkAlways) {
        if (_focusNode.hasFocus) {
          _cursorBlinkController.repeat(reverse: true);
        } else {
          _cursorBlinkController.stop();
          _cursorBlinkController.value = 1;
        }
      }
      _updateCursorPosition(rerender: true);
      setState(() {});
    };
    _focusNode.addListener(_focusListener!);
  }

  void _setupTextListener() {
    _textListener = () {
      if (!mounted) return;
      if (widget.shouldBlinkAlways || _focusNode.hasFocus) {
        _cursorBlinkController.repeat(reverse: true);
      }

      final cursorOffset = _effectiveController.selection.base.offset;
      if (cursorOffset < 0 ||
          cursorOffset > _effectiveController.text.length) {
        return;
      }

      _measurementController.value = TextEditingValue(
        text: _effectiveController.text.substring(0, cursorOffset),
      );

      final isCursorAtEnd =
          cursorOffset == _effectiveController.text.length;
      if (isCursorAtEnd && _scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients &&
              _scrollController.position.maxScrollExtent > 0) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          }
        });
      }

      setState(() {});
    };
    _effectiveController.addListener(_textListener!);
  }

  void _setupScrollListener() {
    _scrollListener = () {
      _updateCursorPosition(rerender: true);
    };
    _scrollController.addListener(_scrollListener!);
  }

  @override
  void didUpdateWidget(CustomCursorTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.blinkDuration != oldWidget.blinkDuration) {
      _cursorBlinkController.duration = widget.blinkDuration;
    }

    if (widget.controller != oldWidget.controller) {
      if (_textListener != null && oldWidget.controller != null) {
        oldWidget.controller!.removeListener(_textListener!);
      }
      if (_textListener != null) {
        _effectiveController.addListener(_textListener!);
      }
    }

    if (widget.focusNode != oldWidget.focusNode) {
      if (_focusListener != null) {
        (oldWidget.focusNode ?? _focusNode).removeListener(_focusListener!);
      }
      if (_ownsFocusNode && oldWidget.focusNode == null) {
        // We already own _focusNode, just re-add listener
      } else {
        _focusNode = widget.focusNode ?? FocusNode();
      }
      if (_focusListener != null) {
        _focusNode.addListener(_focusListener!);
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cursorBlinkController.dispose();
    _cursorPositionController.dispose();
    _measurementController.dispose();
    if (_focusListener != null) {
      _focusNode.removeListener(_focusListener!);
    }
    if (_ownsFocusNode) {
      _focusNode.dispose();
    }
    if (_textListener != null) {
      _effectiveController.removeListener(_textListener!);
    }
    if (_ownsController) {
      _internalController?.dispose();
    }
    if (_scrollListener != null) {
      _scrollController.removeListener(_scrollListener!);
    }
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isOverflowing =>
      _scrollController.hasClients && _scrollController.offset > 0;

  @override
  Widget build(BuildContext context) {
    _updateCursorPosition();

    return Stack(
      children: [
        _buildTextField(),
        _buildMeasurementField(),
      ],
    );
  }

  Widget _buildTextField() {
    final showHint =
        widget.hint != null && _effectiveController.text.isEmpty;

    final effectiveDecoration = widget.decoration ??
        InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: _isOverflowing
              ? (_effectivePadding as EdgeInsets).copyWith(left: 0)
              : _effectivePadding,
          suffixIcon: widget.suffixIcon,
        );

    final effectiveSelectionControls = widget.enablePaste
        ? widget.selectionControls
        : EmptyTextSelectionControls();

    final textField = TextField(
      onTapOutside: widget.unfocusOnTapOutside
          ? (_) => _focusNode.unfocus()
          : null,
      key: _textFieldKey,
      showCursor: false,
      controller: _effectiveController,
      focusNode: _focusNode,
      scrollController: _scrollController,
      decoration: effectiveDecoration,
      style: widget.style,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      selectionControls: effectiveSelectionControls,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      textCapitalization: widget.textCapitalization,
    );

    final fadeWidth =
        widget.overflowFadeWidth ?? _horizontalPadding;

    final fadeGradient = widget.overflowFadeGradient ??
        const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.black],
          stops: [0.0, 1.0],
        );

    final resolvedCursorColor =
        widget.cursorColor ?? Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        if (_isOverflowing)
          ShaderMask(
            shaderCallback: (Rect bounds) => fadeGradient.createShader(
              Rect.fromLTWH(0, 0, fadeWidth, bounds.height),
            ),
            blendMode: BlendMode.dstIn,
            child: textField,
          )
        else
          textField,
        if (showHint && widget.decoration == null)
          Positioned.fill(
            child: IgnorePointer(
              child: Padding(
                padding: _effectivePadding.add(
                  EdgeInsets.only(left: widget.hintLeftOffset),
                ),
                child: Text(
                  widget.hint!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: widget.textAlign,
                  style: widget.hintStyle ??
                      (widget.style ?? const TextStyle())
                          .copyWith(color: Colors.grey),
                ),
              ),
            ),
          ),
        if (_isCursorVisible &&
            (widget.shouldBlinkAlways || _focusNode.hasFocus))
          _buildCustomCursor(resolvedCursorColor),
      ],
    );
  }

  Widget _buildCustomCursor(Color cursorColor) {
    return AnimatedBuilder(
      animation: _cursorPositionController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            _cursorPositionController.value - (widget.iconSize / 2),
            0,
          ),
          child: child,
        );
      },
      child: FadeTransition(
        opacity: _cursorBlinkController.view,
        child: Padding(
          padding: _effectivePadding,
          child: Container(
            constraints:
                BoxConstraints.tightFor(width: widget.iconSize),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  constraints:
                      BoxConstraints.tightFor(width: widget.cursorWidth),
                  height: _measurementSize.height * widget.cursorHeightRatio,
                  decoration: BoxDecoration(
                    color: cursorColor,
                    boxShadow: widget.cursorBoxShadow,
                  ),
                ),
                Positioned(
                  top: _measurementSize.height * widget.cursorHeightRatio +
                      widget.iconGap +
                      widget.iconTopOffset,
                  left: widget.iconLeftOffset,
                  child: SizedBox(
                    width: widget.iconSize,
                    height: widget.iconSize,
                    child: widget.icon ??
                        Icon(
                          Icons.arrow_drop_down,
                          size: widget.iconSize,
                          color: cursorColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMeasurementField() {
    return IgnorePointer(
      child: Opacity(
        opacity: 0,
        child: UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child: IntrinsicWidth(
            child: TextField(
              key: _measurementFieldKey,
              controller: _measurementController,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: widget.style,
              keyboardType: widget.keyboardType,
            ),
          ),
        ),
      ),
    );
  }
}
