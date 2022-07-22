import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lecture/app.dart';
import 'package:lecture/scope/app_scope.dart';
import 'package:quick_quotes_quill/all.dart';

class Smth extends ConsumerWidget {
  const Smth({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}

void main() {
  testWidgets('some test', (tester) async {
    await tester.pumpWidget(
      AppScope(
        spreadQuillManager: SpreadQuillManager('123'),
        child: const Smth(
          child: App(),
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    final manager = AppScope.get().loggerManager;
    final ref = tester.element<ConsumerStatefulElement>(find.byType(Smth));
    final name = ref.read(manager).name;
    expect(name, equals('123'));

    debugDefaultTargetPlatformOverride = null;
  });
}
