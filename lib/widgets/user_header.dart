import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final avatar = user.avatar;

    final middleN = user.middleName;
    late final String name;
    if (middleN != null) {
      name = '${user.lastName} ${user.firstName}\n$middleN';
    } else {
      name = '${user.lastName} ${user.firstName}';
    }

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
            child: avatar != null && avatar.isNotEmpty
                ? Image.network(
                    avatar,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      ref
                          .read(AppScope.get().loggerManager)
                          .info('Загрузка аватара...');
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

                      if (avatar.isEmpty) {
                        return Icon(
                          Icons.person,
                          size: const_measures.bigIconSize,
                          color: theme.hintColor,
                        );
                      }

                      return Icon(
                        Icons.warning_amber_outlined,
                        size: const_measures.midIconSize,
                        color: theme.errorColor,
                      );
                    },
                  )
                : Icon(
                    Icons.person,
                    size: const_measures.bigIconSize,
                    color: theme.hintColor,
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
