import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/measures.dart' as const_measures;
import '../scope/app_scope.dart';

const _avatarSize = 76.0;
const _namePadding = EdgeInsets.symmetric(vertical: 10);

class UserHeader extends ConsumerWidget {
  const UserHeader({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final middleN = user.middleName;
    late final String name;
    if (middleN != null) {
      name = '${user.lastName} ${user.firstName}\n$middleN';
    } else {
      name = '${user.lastName} ${user.firstName}';
    }

    ref.read(AppScope.get().loggerManager).info('Загрузка аватара...');

    return Column(
      children: [
        Container(
          height: _avatarSize,
          width: _avatarSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              const_measures.mainBorderRadius,
            ),
            border: Border.all(
              color: theme.primaryColor,
            ),
          ),
          child: ClipRRect(
            // TODO: remove small areas in corners
            borderRadius: BorderRadius.circular(
              const_measures.mainBorderRadius,
            ),
            child: Image.network(
              user.avatar ?? '',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child;
                }

                return Icon(
                  Icons.person,
                  size: const_measures.bigIconSize,
                  color: theme.hintColor,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                ref.read(AppScope.get().loggerManager).error(
                      'Ошибка загрузки аватара:\n$error\n$stackTrace',
                    );

                if (user.avatar?.isEmpty != false) {
                  return Icon(
                    Icons.person,
                    size: const_measures.bigIconSize,
                    color: theme.hintColor,
                  );
                }

                return Icon(
                  Icons.warning_amber_outlined,
                  size: const_measures.smallIconSize,
                  color: theme.errorColor,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: _namePadding,
          child: Text(
            name,
            style: theme.textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
