import 'package:flutter/material.dart';

class LectureEditorScreen extends StatelessWidget {
  const LectureEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Map<IconData, bool>> toolConfiguration = ValueNotifier({
      Icons.format_bold_outlined: false,
      Icons.text_format_outlined: false,
      Icons.font_download: false,
      Icons.format_italic_outlined: false,
      Icons.aspect_ratio_outlined: false,
      Icons.color_lens_outlined: false,
      Icons.link_outlined: false,
      Icons.attach_file_outlined: false,
      Icons.edit_outlined: true,
    });
    Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);
    Color shadowColor = const Color(0xFF000000);
    Color primaryColor = const Color(0xFF14A391);
    TextStyle headline2 = TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: shadowColor,
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: primaryColor,
            size: 36.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Новая лекция',
          style: headline2,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_outlined,
              color: primaryColor,
              size: 36.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            children: [
              ToolBar(
                toolConfiguration: toolConfiguration,
              ),
              const TopicTextField(),
              const EditorCanvas(),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolBar extends StatelessWidget {
  const ToolBar({
    Key? key,
    required this.toolConfiguration,
  }) : super(key: key);

  final ValueNotifier<Map<IconData, bool>> toolConfiguration;

  @override
  Widget build(BuildContext context) {
    Color disabledColor = const Color(0xFFEDEDED);
    Color hintColor = const Color(0xFFB4B4B4);
    Color primaryColor = const Color(0xFF14A391);
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: disabledColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: toolConfiguration.value.keys.map<Widget>((IconData icon) {
          return Flexible(
            child: RawMaterialButton(
              child: ValueListenableBuilder(
                  valueListenable: toolConfiguration,
                  builder: (context, Map configuration, _) {
                    return Icon(
                      icon,
                      color: configuration[icon] ? primaryColor : hintColor,
                      size: 24.0,
                    );
                  }),
              onPressed: () {
                toolConfiguration.value[icon] = !toolConfiguration.value[icon]!;
                toolConfiguration.value = Map.from(toolConfiguration.value);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TopicTextField extends StatelessWidget {
  const TopicTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);
    Color hintColor = const Color(0xFFB4B4B4);
    Color shadowColor = const Color(0xFF000000);
    TextStyle bodyText1 = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: shadowColor,
    );
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 9.0),
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: shadowColor,
        ),
      ),
      child: TextFormField(
        scrollPhysics: const BouncingScrollPhysics(),
        style: bodyText1,
        decoration: InputDecoration(
          hintText: 'Тема',
          hintStyle: bodyText1.copyWith(color: hintColor),
          border: InputBorder.none,
          isCollapsed: true,
        ),
      ),
    );
  }
}

class EditorCanvas extends StatelessWidget {
  const EditorCanvas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);
    Color hintColor = const Color(0xFFB4B4B4);
    Color shadowColor = const Color(0xFF000000);
    TextStyle bodyText1 = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: shadowColor,
    );
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 15.0),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: shadowColor,
          ),
        ),
        child: Scrollbar(
          interactive: true,
          radius: const Radius.circular(5.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
            child: TextFormField(
              scrollPhysics: const BouncingScrollPhysics(),
              style: bodyText1,
              maxLines: 9999999,
              decoration: InputDecoration(
                hintText: 'Лекция',
                hintStyle: bodyText1.copyWith(color: hintColor),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
