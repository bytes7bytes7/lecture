import 'package:flutter/material.dart';

import 'sized_icon_button.dart';

const _amountOfStars = 5;
const _starPadding = EdgeInsets.symmetric(horizontal: 7.0);

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.ratingNotifier,
  }) : super(key: key);

  final ValueNotifier<int> ratingNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: ratingNotifier,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _amountOfStars,
            (index) {
              return Padding(
                padding: _starPadding,
                child: SizedIconButton(
                  icon: (index < value) ? Icons.star : Icons.star_border,
                  tooltip: '${index + 1}',
                  onPressed: () {
                    ratingNotifier.value = index + 1;
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
