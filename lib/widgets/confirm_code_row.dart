import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinEntryTextField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onSubmit;
  final String? lastPin;
  final int fields;
  final TextStyle textStyle;
  final bool isTextObscure;
  final Color cursorColor;

  const PinEntryTextField({
    Key? key,
    required this.formKey,
    required this.onSubmit,
    this.lastPin,
    this.fields = 4,
    this.isTextObscure = false,
    this.cursorColor = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 20.0, color: Colors.black),
  })  : assert(fields > 0),
        super(key: key);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List.generate(widget.fields, (index) => null);
    _focusNodes = List.generate(widget.fields, (index) => null);
    _textControllers = List.generate(widget.fields, (index) => null);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t!.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        verticalDirection: VerticalDirection.down,
        children: textFields,
      ),
    );
  }

  void clearTextFields() {
    for (var t in _textControllers) {
      t!.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    final String lastDigit = _textControllers[i]!.text;

    return SizedBox(
      width: 50.0,
      height: 76.0,
      child: TextFormField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: widget.textStyle,
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          return 'fty';
        },
        decoration: InputDecoration(
          counterText: '',
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
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
        ),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (str.isEmpty) {
            return;
          }
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (lastDigit.isNotEmpty && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (lastDigit.isNotEmpty && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onFieldSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
