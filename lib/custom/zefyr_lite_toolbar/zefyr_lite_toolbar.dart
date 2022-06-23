import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart' hide ToggleStyleButton, LinkStyleButton;

part 'toggle_style_button.dart';

part 'toggle_notifier_button.dart';

part 'link_style_button.dart';

part 'link_dialog.dart';

typedef ChildBuilder = Widget Function(
  BuildContext,
  IconData,
  bool,
  VoidCallback?,
);

class ZefyrLiteToolbar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> children;

  final Color dividerColor;

  ZefyrLiteToolbar({
    super.key,
    required ZefyrController controller,
    required ValueNotifier<bool> notifier,
    required this.dividerColor,
  })  : children = <Widget>[
          ToggleStyleButton(
            attribute: NotusAttribute.bold,
            icon: Icons.format_bold,
            controller: controller,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.italic,
            icon: Icons.format_italic,
            controller: controller,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.strikethrough,
            icon: Icons.format_strikethrough,
            controller: controller,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.underline,
            icon: Icons.format_underline,
            controller: controller,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.block.numberList,
            controller: controller,
            icon: Icons.format_list_numbered,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.block.bulletList,
            controller: controller,
            icon: Icons.format_list_bulleted,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleStyleButton(
            attribute: NotusAttribute.block.code,
            controller: controller,
            icon: Icons.code,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          LinkStyleButton(
            controller: controller,
          ),
          Container(
            width: 1,
            color: dividerColor,
          ),
          ToggleNotifierButton(
            icon: Icons.edit,
            notifier: notifier,
          ),
        ];

  @override
  State<ZefyrLiteToolbar> createState() => _ZefyrLiteToolbarState();

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}

class _ZefyrLiteToolbarState extends State<ZefyrLiteToolbar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: BoxConstraints.tightFor(height: widget.preferredSize.height),
      decoration: BoxDecoration(
        color: theme.disabledColor,
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
