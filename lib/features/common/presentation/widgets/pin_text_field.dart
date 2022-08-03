import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/measures.dart' as const_measures;

const _cellWidth = 50.0;
const _cellHeight = 76.0;
const _cellAmount = 4;
const _borderWidth = 1.0;
const _borderWidthBold = 2.0;
const _contentPadding = EdgeInsets.symmetric(vertical: 15.0);

class PinTextField extends StatefulWidget {
  const PinTextField({
    super.key,
    required this.onSubmit,
    this.enabled,
  });

  final ValueChanged<String> onSubmit;
  final bool? enabled;

  @override
  State<PinTextField> createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  final _pin = List<String>.generate(_cellAmount, (index) => '');
  final _focusNodes =
      List<FocusNode>.generate(_cellAmount, (index) => FocusNode());
  final _textControllers = List<TextEditingController>.generate(
    _cellAmount,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        _cellAmount,
        (i) {
          return SizedBox(
            width: _cellWidth,
            child: TextField(
              controller: _textControllers[i],
              enabled: widget.enabled,
              focusNode: _focusNodes[i],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: theme.primaryColor,
              style: theme.textTheme.headline5?.copyWith(
                color: theme.shadowColor,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (str) => _onChanged(str, i),
              onSubmitted: _onSubmitted,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: _contentPadding,
                constraints: const BoxConstraints(
                  minHeight: _cellHeight,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    const_measures.mainBorderRadius,
                  ),
                  borderSide: BorderSide(
                    width: _borderWidth,
                    color: theme.hintColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    const_measures.mainBorderRadius,
                  ),
                  borderSide: BorderSide(
                    width: _borderWidthBold,
                    color: theme.primaryColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    const_measures.mainBorderRadius,
                  ),
                  borderSide: BorderSide(
                    width: _borderWidth,
                    color: theme.disabledColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onChanged(String str, int i) {
    if (str.isEmpty) {
      _pin[i] = '';
    } else {
      final lst = str.split('');
      for (var j = i; j < _cellAmount && j - i < str.length; j++) {
        _textControllers[j].text = _pin[j] = lst[j - i];
        _focusNodes[j].unfocus();
        if (j < _cellAmount - 1) {
          FocusScope.of(context).requestFocus(_focusNodes[j + 1]);
        }
      }
    }

    if (_pin.every((digit) => digit.isNotEmpty)) {
      widget.onSubmit(_pin.join());
    }
  }

  void _onSubmitted(String str) {
    if (_pin.every((digit) => digit.isNotEmpty)) {
      widget.onSubmit(_pin.join());
    }
  }
}
