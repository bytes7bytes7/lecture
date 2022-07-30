import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../custom/always_bouncing_scroll_physics.dart';
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

const _authorPadding = EdgeInsets.symmetric(vertical: 15);
const _amount = 8;

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({
    super.key,
    required this.author,
  });

  final User author;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: l10n.tooltipBack,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: author.beautifulID,
        canCopyTitle: true,
      ),
      body: Center(
        // TODO: add RefreshIndicator
        // TODO: add request to get lectures (with pagination)
        child: ListView.builder(
          physics: const AlwaysBouncingScrollPhysics(),
          itemCount: _amount + 1,
          itemBuilder: (context, index) {
            if (index != 0) {
              return LectureCard(
                lecture: Lecture.random(),
              );
            }

            return Padding(
              padding: _authorPadding,
              child: Column(
                children: [
                  UserHeader(
                    user: author,
                  ),
                  Text(
                    l10n.amountOfLectures(_amount),
                    style: theme.textTheme.bodyText1
                        ?.copyWith(color: theme.hintColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
