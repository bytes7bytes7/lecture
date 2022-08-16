import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../scope/app_scope.dart';
import '../widgets/widgets.dart';

const _heightFactor = 0.7;

void showFilterOverlay({
  required BuildContext context,
  required WidgetRef ref,
}) {
  final theme = Theme.of(context);
  final l10n = context.l10n;

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // TODO: find way to dynamically change size
      return FractionallySizedBox(
        heightFactor: _heightFactor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(const_measures.overlayBorderRadius),
              topRight: Radius.circular(const_measures.overlayBorderRadius),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const DragContainer(),
                const Spacer(),
                SelectField(
                  value: ref.watch(
                    AppScope.get().filter.select((value) => value.institution),
                  ),
                  hint: l10n.institution,
                  items: const ['1', '2'],
                  onChanged: (String value) {
                    ref.read(AppScope.get().filter.notifier).institution =
                        value;
                  },
                ),
                SelectField(
                  value: ref.watch(
                    AppScope.get().filter.select((value) => value.subject),
                  ),
                  hint: l10n.subject,
                  items: const ['1', '2'],
                  onChanged: (String value) {
                    ref.read(AppScope.get().filter.notifier).subject = value;
                  },
                ),
                SelectField(
                  value: ref.watch(
                    AppScope.get().filter.select((value) => value.lecturer),
                  ),
                  hint: l10n.fullNameOfLecturer,
                  items: const ['1', '2'],
                  onChanged: (String value) {
                    ref.read(AppScope.get().filter.notifier).lecturer = value;
                  },
                ),
                SelectField(
                  value: ref.watch(
                    AppScope.get().filter.select((value) => value.author),
                  ),
                  hint: l10n.author,
                  items: const ['1', '2'],
                  onChanged: (String value) {
                    ref.read(AppScope.get().filter.notifier).author = value;
                  },
                ),
                SelectDateField(
                  begin: DateTime.utc(2022, 6, 6),
                  end: DateTime.utc(2022, 6, 10),
                ),
                const Spacer(),
                DoubleButton(
                  secondary: l10n.clearFilter,
                  secondaryOnPressed: () => _dropFilter(ref),
                  primary: l10n.done,
                  primaryOnPressed: () => _onDone(context, ref),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _dropFilter(WidgetRef ref) {
  ref.read(AppScope.get().filter.notifier).dropFilter();
}

void _onDone(BuildContext context, WidgetRef ref) {
  ref.read(AppScope.get().filter.notifier).updateFilter();
  Navigator.of(context).pop();
}
