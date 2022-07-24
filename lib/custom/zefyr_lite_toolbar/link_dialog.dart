// ignore_for_file: unused_element

part of 'zefyr_lite_toolbar.dart';

class _LinkDialog extends StatefulWidget {
  const _LinkDialog({super.key});

  @override
  _LinkDialogState createState() => _LinkDialogState();
}

class _LinkDialogState extends State<_LinkDialog> {
  String _link = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return AlertDialog(
      backgroundColor: theme.scaffoldBackgroundColor,
      content: TextField(
        cursorColor: theme.primaryColor,
        style: theme.textTheme.bodyText1?.copyWith(color: theme.shadowColor),
        decoration: InputDecoration(
          labelText: l10n.link,
          labelStyle: TextStyle(
            color: theme.primaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColor,
            ),
          ),
        ),
        autofocus: true,
        onChanged: _linkChanged,
      ),
      actions: [
        TextButton(
          onPressed: _link.isNotEmpty ? _applyLink : null,
          child: Text(
            l10n.ok,
            style: TextStyle(
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  void _linkChanged(String value) {
    setState(() {
      _link = value;
    });
  }

  void _applyLink() {
    Navigator.pop(context, _link);
  }
}
