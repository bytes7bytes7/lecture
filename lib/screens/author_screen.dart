import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;
import '../features/common/common.dart';
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

const _authorPadding = EdgeInsets.symmetric(
  vertical: const_measures.mainVerMargin,
);
const _amount = 8;

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({
    super.key,
    required this.authorId,
  });

  final int authorId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    // TODO: make a request
    final author = User.random();

    return Scaffold(
      appBar: DefaultAppBar(
        prefixConfig: AppBarButtonConfig(
          icon: Icons.arrow_back,
          tooltip: l10n.tooltipBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
            if (index == 0) {
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
            }

            return LectureCard(
              lecture: Lecture.random(),
            );
          },
        ),
      ),
    );
  }
}
