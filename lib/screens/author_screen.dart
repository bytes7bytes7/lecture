import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';

import '../constants/tooltips.dart' as const_tooltips;
import '../custom/always_bouncing_scroll_physics.dart';
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

    return Scaffold(
      appBar: DefaultAppBar(
        prefix: Icons.arrow_back,
        prefixTooltip: const_tooltips.back,
        prefixOnPressed: () {
          Navigator.pop(context);
        },
        title: author.beautifulID,
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
                    '$_amount Лекций',
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
