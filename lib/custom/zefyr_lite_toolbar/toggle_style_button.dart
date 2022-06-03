part of 'zefyr_lite_toolbar.dart';

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
  State<ToggleStyleButton> createState() => _ToggleStyleButtonState();
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
      ? Theme.of(context).primaryColor
      : Theme.of(context).hintColor
      : theme.disabledColor;
  return ZIconButton(
    highlightElevation: 0,
    hoverElevation: 0,
    size: 32,
    icon: Icon(icon, size: 18, color: iconColor),
    fillColor: Theme.of(context).disabledColor,
    onPressed: onPressed,
  );
}