import 'package:flutter/material.dart';

import '../constants/tooltips.dart' as const_tooltips;
import '../overlays/show_select_overlay.dart';
import 'sized_icon_button.dart';

class SelectField extends StatelessWidget {
  const SelectField({
    Key? key,
    required this.notifier,
    required this.defaultText,
    required this.items,
  }) : super(key: key);

  final ValueNotifier<String> notifier;
  final String defaultText;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        children: [
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, String value, _) {
              return Expanded(
                child: (value.isNotEmpty)
                    ? Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : Text(
                        defaultText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
              );
            },
          ),
          SizedIconButton(
            size: 24.0,
            icon: Icons.search,
            onPressed: () async {
              showSelectOverlay(
                context: context,
                items: items,
                notifier: notifier,
              );
            },
            message: const_tooltips.choose,
          ),
        ],
      ),
    );
  }
}
