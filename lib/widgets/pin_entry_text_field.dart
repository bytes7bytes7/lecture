import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/measures.dart' as const_measures;

const _cellWidth = 50.0;
const _cellHeight = 76.0;
const _cellAmount = 4;
const _borderWidth = 1.0;
const _borderWidthBold = 2.0;
const _contentPadding = EdgeInsets.symmetric(vertical: 15.0);

class PinEntryTextField extends StatefulWidget {
  final ValueNotifier<bool> errorNotifier;
  final ValueChanged<String> onSubmit;

  const PinEntryTextField({
    super.key,
    required this.errorNotifier,
    required this.onSubmit,
  });

  @override
  State<PinEntryTextField> createState() => _PinEntryTextFieldState();
}

class _PinEntryTextFieldState extends State<PinEntryTextField> {
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
            child: ValueListenableBuilder<bool>(
              valueListenable: widget.errorNotifier,
              builder: (context, error, child) {
                return TextField(
                  controller: _textControllers[i],
                  focusNode: _focusNodes[i],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  cursorColor: theme.primaryColor,
                  style: theme.textTheme.headline2
                      ?.copyWith(color: theme.shadowColor),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: _contentPadding,
                    constraints: const BoxConstraints(
                      minHeight: _cellHeight,
                    ),
                    errorText: error ? '' : null,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        const_measures.mainBorderRadius,
                      ),
                      borderSide: BorderSide(
                        width: _borderWidth,
                        color: theme.errorColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        const_measures.mainBorderRadius,
                      ),
                      borderSide: BorderSide(
                        width: _borderWidthBold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  onChanged: (str) => _onChanged(str, i),
                  onSubmitted: _onSubmitted,
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onChanged(String str, int i) {
    widget.errorNotifier.value = false;

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
