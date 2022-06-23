import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
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
              'Личное',
              style: theme.textTheme.headline2,
            ),
          ),
          Container(
            margin: _textMargin,
            child: Text(
              'Заполните следующие поля, чтобы другие пользователи могли Вас найти',
              style: theme.textTheme.bodyText1,
            ),
          ),
          ...<MapEntry<String, IconData>>[
            const MapEntry('Имя', Icons.person),
            const MapEntry('Фамилия', Icons.person),
            const MapEntry('Отчество', Icons.person),
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
            text: 'Далее',
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
