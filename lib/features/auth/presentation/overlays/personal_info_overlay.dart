import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common.dart';
import '../../../../l10n/l10n.dart';
import '../../../../scope/app_scope.dart';
import '../../../../structs/quintet.dart';
import '../../../../widgets/widgets.dart';
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

    final state = ref.watch(AppScope.get().authController);

    return CardOverlay(
      title: l10n.personalTitle,
      description: l10n.personalDesc,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ...<
                Quintet<IconData, String, bool, TextEditingController,
                    FormFieldValidator<String>>>[
              Quintet(
                Icons.person,
                l10n.firstName,
                state is! AsyncLoading,
                _nameController,
                (_) => simpleValidator(
                  value: _nameController.text,
                  l10n: l10n,
                ),
              ),
              Quintet(
                Icons.person,
                l10n.lastName,
                state is! AsyncLoading,
                _surnameController,
                (_) => simpleValidator(
                  value: _surnameController.text,
                  l10n: l10n,
                ),
              ),
              Quintet(
                Icons.person,
                l10n.middleName,
                state is! AsyncLoading,
                _middleNameController,
                // no validator
              ),
            ].map(
              (e) {
                return SimpleTextField(
                  icon: e.first,
                  hint: e.second,
                  enabled: e.third,
                  controller: e.fourth,
                  validator: e.fifth,
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
            onPressed: (value && state is! AsyncLoading) ? _next : null,
          );
        },
      ),
    );
  }

  void _next() {
    // TODO: add somewhere modification of user provider
    ref.read(AppScope.get().loggerManager).log('get personal info');
    ref.read(AppScope.get().authController.notifier).setPersonalInfo(
          firstName: _nameController.text,
          lastName: _surnameController.text,
          middleName: _middleNameController.text,
        );
  }
}
