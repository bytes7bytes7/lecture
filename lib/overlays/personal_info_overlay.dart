import 'package:flutter/material.dart';

import '../constants/routes.dart' as const_routes;
import '../l10n/l10n.dart';
import '../structs//trio.dart';
import '../widgets/widgets.dart';
import 'card_overlay.dart';

class PersonalInfoOverlay extends StatelessWidget {
  const PersonalInfoOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.personalTitle,
      description: l10n.personalDesc,
      body: Form(
        // TODO: add key, validators
        child: Column(
          children: [
            ...<Trio<IconData, String, FormFieldValidator<String>>>[
              Trio(
                Icons.person,
                l10n.firstName,
                (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.fillField;
                  }
                  return null;
                },
              ),
              Trio(
                Icons.person,
                l10n.lastName,
                (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.fillField;
                  }
                  return null;
                },
              ),
              Trio(
                Icons.person,
                l10n.middleName,
                (value) {
                  return null;
                },
              ),
            ].map(
              (e) {
                return SimpleTextField(
                  icon: e.first,
                  hint: e.second,
                  validator: e.third,
                );
              },
            ),
          ],
        ),
      ),
      footer: SingleButton(
        text: l10n.moveNext,
        onPressed: () => _next(context),
      ),
    );
  }

  void _next(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(const_routes.home);
  }
}
