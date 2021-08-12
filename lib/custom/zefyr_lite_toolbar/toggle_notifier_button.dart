part of 'zefyr_lite_toolbar.dart';

class ToggleNotifierButton extends StatefulWidget {
  const ToggleNotifierButton({
    Key? key,
    required this.icon,
    required this.notifier,
    this.childBuilder = _toggleStyleButtonChildBuilder,
  }) : super(key: key);

  final IconData icon;
  final ValueNotifier<bool> notifier;
  final Function childBuilder;

  @override
  _ToggleNotifierButtonState createState() => _ToggleNotifierButtonState();
}

class _ToggleNotifierButtonState extends State<ToggleNotifierButton> {
  @override
  Widget build(BuildContext context) {
    return widget.childBuilder(context, widget.icon, widget.notifier.value, () {
      setState(() {
        widget.notifier.value = !widget.notifier.value;
      });
    });
  }
}