import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../structs/quartet.dart';
import '../widgets/widgets.dart';
import 'card_overlay.dart';

class PersonalInfoOverlay extends ConsumerStatefulWidget {
  const PersonalInfoOverlay({super.key});

  @override
  ConsumerState<PersonalInfoOverlay> createState() =>
      _PersonalInfoOverlayState();
}

class _PersonalInfoOverlayState extends ConsumerState<PersonalInfoOverlay> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _middleNameController;
  late final ValueNotifier<bool> _areFieldsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController()..addListener(_onChanged);
    _surnameController = TextEditingController()..addListener(_onChanged);
    _middleNameController = TextEditingController();
    _areFieldsValid = ValueNotifier(false);
  }

  void _onChanged() {
    if (_formKey.currentState?.validate() == true) {
      if (!_areFieldsValid.value) {
        _areFieldsValid.value = true;
      }
    } else {
      if (_areFieldsValid.value) {
        _areFieldsValid.value = false;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _middleNameController.dispose();
    _areFieldsValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CardOverlay(
      title: l10n.personalTitle,
      description: l10n.personalDesc,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ...<
                Quartet<IconData, String, TextEditingController,
                    FormFieldValidator<String>>>[
              Quartet(
                Icons.person,
                l10n.firstName,
                _nameController,
                (_) => simpleValidator(
                  value: _nameController.text,
                  l10n: l10n,
                ),
              ),
              Quartet(
                Icons.person,
                l10n.lastName,
                _surnameController,
                (_) => simpleValidator(
                  value: _surnameController.text,
                  l10n: l10n,
                ),
              ),
              Quartet(
                Icons.person,
                l10n.middleName,
                _middleNameController,
                // no validator
              ),
            ].map(
              (e) {
                return SimpleTextField(
                  icon: e.first,
                  hint: e.second,
                  controller: e.third,
                  validator: e.fourth,
                );
              },
            ),
          ],
        ),
      ),
      footer: ValueListenableBuilder<bool>(
        valueListenable: _areFieldsValid,
        builder: (context, value, child) {
          return SingleButton(
            text: l10n.moveNext,
            onPressed: value ? _next : null,
          );
        },
      ),
    );
  }

  void _next() {
    ref.read(AppScope.get().loggerManager).log('get personal info');
    goHome(context);
  }
}
