part of 'zefyr_lite_toolbar.dart';

class LinkStyleButton extends StatefulWidget {
  final ZefyrController controller;

  const LinkStyleButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LinkStyleButton> createState() => _LinkStyleButtonState();
}

class _LinkStyleButtonState extends State<LinkStyleButton> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_didChangeSelection);
  }

  void _didChangeSelection() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant LinkStyleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_didChangeSelection);
      widget.controller.addListener(_didChangeSelection);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_didChangeSelection);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ZIconButton(
      highlightElevation: 0,
      hoverElevation: 0,
      size: 32,
      icon: Icon(
        Icons.link,
        size: 18,
        color: theme.hintColor,
      ),
      fillColor: theme.disabledColor,
      onPressed: () => _openLinkDialog(context),
    );
  }

  void _openLinkDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (ctx) {
        return const _LinkDialog();
      },
    ).then(_linkSubmitted);
  }

  void _linkSubmitted(String? value) {
    if (value == null || value.isEmpty) {
      return;
    }
    widget.controller.formatSelection(NotusAttribute.link.fromString(value));
  }
}
