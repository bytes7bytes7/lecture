import 'package:flutter/material.dart';
import 'package:lecture/custom/open_overlay.dart';
import 'package:lecture/overlays/sign_up_overlay.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fullHeight = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    final double height = fullHeight - padding.top - padding.bottom;
    WidgetsBinding.instance!.addPostFrameCallback((_){
      if (OverlayViewer.height == null) {
        OverlayViewer.openOverlay(
            context: context, overlay: const SignUpOverlay());
      }
    });
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:
                                Theme.of(context).textTheme.headline1!.fontSize,
                            width:
                                Theme.of(context).textTheme.headline1!.fontSize,
                            child:
                                Image.asset('assets/images/ic_launcher_96.png'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Лекция',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: Theme.of(context).textTheme.headline1!.fontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
