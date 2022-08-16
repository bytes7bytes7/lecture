import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/app.dart' as const_app;
import '../../../../constants/measures.dart' as const_measures;

const _cellWidth = 50.0;
const _cellHeight = 76.0;
const _borderWidth = 1.0;
const _borderWidthBold = 2.0;
const _contentPadding = EdgeInsets.symmetric(vertical: 15.0);

class PinTextField extends StatefulWidget {
  const PinTextField({
    super.key,
    required this.onChanged,
    this.enabled,
  });

  final ValueChanged<String> onChanged;
  final bool? enabled;

  @override
  State<PinTextField> createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  final _pin = List<String>.generate(const_app.pinLen, (index) => '');
  final _focusNodes =
      List<FocusNode>.generate(const_app.pinLen, (index) => FocusNode());
  final _textControllers = List<TextEditingController>.generate(
    const_app.pinLen,
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
        const_app.pinLen,
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
      for (var j = i; j < const_app.pinLen && j - i < str.length; j++) {
        _textControllers[j].text = _pin[j] = lst[j - i];
        _focusNodes[j].unfocus();
        if (j < const_app.pinLen - 1) {
          FocusScope.of(context).requestFocus(_focusNodes[j + 1]);
        }
      }
    }

    widget.onChanged(_pin.join());
  }
}
