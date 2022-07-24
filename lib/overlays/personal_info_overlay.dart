import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

const _padding = EdgeInsets.symmetric(
  horizontal: const_measures.mainHorMargin,
);
const _titleMargin = EdgeInsets.only(
  top: 30.0,
);
const _textMargin = EdgeInsets.symmetric(
  vertical: 10.0,
);

class PersonalInfoOverlay extends StatelessWidget {
  const PersonalInfoOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final constraints = ConstraintInherited.of(context).constraints;

    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: _padding,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(const_measures.overlayBorderRadius),
          topRight: Radius.circular(const_measures.overlayBorderRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: _titleMargin,
            child: Text(
              l10n.personalTitle,
              style: theme.textTheme.headline2,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              l10n.personalDesc,
              style: theme.textTheme.bodyText1,
            ),
          ),
          ...<MapEntry<String, IconData>>[
            MapEntry(l10n.firstName, Icons.person),
            MapEntry(l10n.lastName, Icons.person),
            MapEntry(l10n.middleName, Icons.person),
          ].map(
            (pair) {
              return SimpleTextField(
                icon: pair.value,
                hint: pair.key,
              );
            },
          ),
          const Spacer(),
          SingleButton(
            text: l10n.moveNext,
            onPressed: () => _next(context),
          ),
        ],
      ),
    );
  }

  void _next(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(const_routes.home);
  }
}
