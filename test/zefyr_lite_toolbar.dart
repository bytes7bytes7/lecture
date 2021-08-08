import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton;

class ZefyrLiteToolbar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> children;

  ZefyrLiteToolbar(
      {Key? key,
      required ZefyrController controller,
      required ValueNotifier<bool> notifier})
      : children = <Widget>[
          ToggleStyleButton(
            attribute: NotusAttribute.bold,
            icon: Icons.format_bold,
            controller: controller,
          ),
          Container(
            width: 1,
            color: Colors.white,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.italic,
            icon: Icons.format_italic,
            controller: controller,
          ),
          Container(
            width: 1,
            color: Colors.white,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.underline,
            icon: Icons.format_underline,
            controller: controller,
          ),
          Container(
            width: 1,
            color: Colors.white,
          ),
          ToggleEditButton(
            icon: Icons.edit,
            notifier: notifier,
          ),
        ],
        super(key: key);

  @override
  _ZefyrLiteToolbarState createState() => _ZefyrLiteToolbarState();

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}

class _ZefyrLiteToolbarState extends State<ZefyrLiteToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: BoxConstraints.tightFor(height: widget.preferredSize.height),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.children,
        ),
      ),
    );
  }
}

class ToggleStyleButton extends StatefulWidget {
  ToggleStyleButton({
    Key? key,
    required this.attribute,
    required this.icon,
    required this.controller,
    this.childBuilder = _toggleStyleButtonChildBuilder,
  })  : assert(!attribute.isUnset),
        super(key: key);

  final NotusAttribute attribute;
  final IconData icon;
  final ZefyrController controller;
  final Function childBuilder;

  @override
  _ToggleStyleButtonState createState() => _ToggleStyleButtonState();
}

class _ToggleStyleButtonState extends State<ToggleStyleButton> {
  late bool _isToggled;

  NotusStyle get _selectionStyle => widget.controller.getSelectionStyle();

  void _didChangeEditingValue() {
    setState(() {
      _isToggled =
          widget.controller.getSelectionStyle().containsSame(widget.attribute);
    });
  }

  @override
  void initState() {
    super.initState();
    _isToggled = _selectionStyle.containsSame(widget.attribute);
    widget.controller.addListener(_didChangeEditingValue);
  }

  @override
  void didUpdateWidget(covariant ToggleStyleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_didChangeEditingValue);
      widget.controller.addListener(_didChangeEditingValue);
      _isToggled = _selectionStyle.containsSame(widget.attribute);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_didChangeEditingValue);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isInCodeBlock =
        _selectionStyle.containsSame(NotusAttribute.block.code);
    final isEnabled =
        !isInCodeBlock || widget.attribute == NotusAttribute.block.code;
    return widget.childBuilder(
        context, widget.icon, _isToggled, isEnabled ? _toggleAttribute : null);
  }

  void _toggleAttribute() {
    if (_isToggled) {
      widget.controller.formatSelection(widget.attribute.unset);
    } else {
      widget.controller.formatSelection(widget.attribute);
    }
  }
}

Widget _toggleStyleButtonChildBuilder(
  BuildContext context,
  IconData icon,
  bool isToggled,
  VoidCallback? onPressed,
) {
  final theme = Theme.of(context);
  final isEnabled = onPressed != null;
  final iconColor = isEnabled
      ? isToggled
          ? const Color(0xFF14A391)
          : const Color(0xFFB4B4B4)
      : theme.disabledColor;
  return ZIconButton(
    highlightElevation: 0,
    hoverElevation: 0,
    size: 32,
    icon: Icon(icon, size: 18, color: iconColor),
    fillColor: const Color(0xFFEDEDED),
    onPressed: onPressed,
  );
}

class ToggleEditButton extends StatefulWidget {
  const ToggleEditButton({
    Key? key,
    required this.icon,
    required this.notifier,
    this.childBuilder = _toggleStyleButtonChildBuilder,
  }) : super(key: key);

  final IconData icon;
  final ValueNotifier<bool> notifier;
  final Function childBuilder;

  @override
  _ToggleEditButtonState createState() => _ToggleEditButtonState();
}

class _ToggleEditButtonState extends State<ToggleEditButton> {
  @override
  Widget build(BuildContext context) {
    return widget.childBuilder(context, widget.icon, widget.notifier.value, () {
      setState(() {
        widget.notifier.value = !widget.notifier.value;
      });
    });
  }
}
