import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinEntryTextField extends StatefulWidget {
  final ValueNotifier<bool> errorNotifier;
  final ValueChanged<String> onSubmit;
  final TextStyle textStyle;
  final bool isTextObscure;
  final Color cursorColor;

  const PinEntryTextField({
    Key? key,
    required this.errorNotifier,
    required this.onSubmit,
    this.isTextObscure = false,
    this.cursorColor = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 20.0, color: Colors.black),
  }) : super(key: key);

  @override
  _PinEntryTextFieldState createState() => _PinEntryTextFieldState();
}

class _PinEntryTextFieldState extends State<PinEntryTextField> {
  final List<String?> _pin = List.generate(4, (index) => null);
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _textControllers =
      List.generate(4, (index) => TextEditingController());

  Widget textFields = Container();

  @override
  void dispose() {
    for (var t in _textControllers) {
      t.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pin.first == null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      verticalDirection: VerticalDirection.down,
      children: List.generate(
        4,
            (int i) {
          return SizedBox(
            width: 50.0,
            height: 76.0,
            child: ValueListenableBuilder(
              valueListenable: widget.errorNotifier,
              builder: (context, bool error, _) {
                return TextField(
                  controller: _textControllers[i],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  cursorColor: widget.cursorColor,
                  maxLength: 1,
                  autofocus: i == 0,
                  style: widget.textStyle,
                  focusNode: _focusNodes[i],
                  obscureText: widget.isTextObscure,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    counterText: '',
                    isCollapsed: true,
                    // TODO: errorBorder makes border smaller
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    errorText: error ? '' : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  onChanged: (String str) {
                    widget.errorNotifier.value = false;
                    _pin[i] = str;
                    if (str.isEmpty) {
                      return;
                    }
                    if (i + 1 != 4) {
                      _focusNodes[i].unfocus();
                      if (_textControllers[i].text.isNotEmpty &&
                          _pin[i] == '') {
                        FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                      } else {
                        FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
                      }
                    } else {
                      _focusNodes[i].unfocus();
                      if (_textControllers[i].text.isNotEmpty &&
                          _pin[i] == '') {
                        FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                      }
                    }
                    if (_pin.every(
                            (String? digit) => digit != null && digit != '')) {
                      widget.onSubmit(_pin.join());
                    }
                  },
                  onSubmitted: (String str) {
                    if (_pin.every(
                            (String? digit) => digit != null && digit != '')) {
                      widget.onSubmit(_pin.join());
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
