import 'package:flutter/material.dart';

class OgButton extends StatefulWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  final Color? color;

  final Color? disabledColor;

  final Color? borderColor;

  final double? borderWidth;

  final BorderRadius? borderRadius;

  final Alignment alignment;

  final VoidCallback? onLongPress;

  final VoidCallback? onPressed;

  bool get enabled => onPressed != null || onLongPress != null;

  const OgButton({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.disabledColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.alignment = Alignment.center,
    this.onLongPress,
    required this.onPressed,
  });

  @override
  State<OgButton> createState() => _OgButtonState();
}

class _OgButtonState extends State<OgButton> {
  late ThemeData _themeData;
// 添加状态变量：跟踪悬浮和点击状态
  bool _isHovered = false;
  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OgButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeData = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final padding =
        widget.padding ?? EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0);
    final enable = widget.enabled;
    final baseColor = widget.color ?? _themeData.primaryColor;
    final disabledColor = widget.disabledColor ?? _themeData.disabledColor;
    final baseBorderColor = widget.borderColor ?? _themeData.primaryColor;
    final borderWidth = widget.borderWidth ?? 1.5;
    final borderRadius =
        widget.borderRadius ?? BorderRadius.all(Radius.circular(8));

    // 根据交互状态动态调整颜色
    Color backgroundColor = enable ? baseColor : disabledColor;
    Color borderColor = enable ? baseBorderColor : disabledColor;

    // 悬浮效果：按钮启用且悬浮时，背景色变亮（示例）
    if (enable && _isHovered && !_isPressed) {
      backgroundColor = backgroundColor.withValues(alpha: 120); // 降低不透明度实现高亮
      borderColor = borderColor.withValues(alpha: 240); // 边框颜色加深
    }

    // 点击效果：按钮启用且按下时，背景色变暗（示例）
    if (enable && _isPressed) {
      backgroundColor = backgroundColor.withValues(alpha: 100); // 进一步降低不透明度
      borderColor = borderColor.withValues(alpha: 60);
    }

    final onPressed = widget.onPressed;
    final onLongPress = widget.onLongPress;
    return MouseRegion(
      cursor: enable ? SystemMouseCursors.click : MouseCursor.defer,
      // 鼠标进入时设置悬浮状态
      onEnter: (event) => setState(() => _isHovered = true),
      // 鼠标离开时重置悬浮状态
      onExit: (event) => setState(() {
        _isHovered = false;
        _isPressed = false;
      }),
      child: GestureDetector(
        // 按下时设置点击状态
        onTapDown: enable ? (_) => setState(() => _isPressed = true) : null,
        // 抬起或取消时重置点击状态
        onTapUp: enable ? (_) => setState(() => _isPressed = false) : null,
        // onTapCancel: enable ? () => setState(() => _isPressed = false) : null,
        onTap: enable
            ? () {
                onPressed?.call();
              }
            : null,
        onLongPress: enable
            ? () {
                onLongPress?.call();
              }
            : null,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor, // 使用动态计算的背景色
            border: Border.all(
              color: borderColor, // 使用动态计算的边框色
              width: borderWidth,
            ),
            borderRadius: borderRadius,
            // 可选：添加悬浮时的阴影效果
            boxShadow: enable && _isHovered
                ? [BoxShadow(color: Colors.black12, blurRadius: 2)]
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
