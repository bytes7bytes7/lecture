import 'package:flutter/material.dart';

import '../global_parameters.dart';
import '../overlays/confirm_overlay.dart';
import '../overlays/personal_info_overlay.dart';
import '../overlays/sign_up_overlay.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final height = size.height - padding.top - padding.bottom;
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SignUpOverlay(constraints: constraints),
                            ValueListenableBuilder(
                              valueListenable:
                                  GlobalParameters.confirmOverlayNotifier,
                              builder: (context, bool value, _) {
                                return AnimatedPositioned(
                                  left: value ? 0 : size.width,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child:
                                      ConfirmOverlay(constraints: constraints),
                                );
                              },
                            ),
                            ValueListenableBuilder(
                              valueListenable:
                                  GlobalParameters.personalInfoOverlayNotifier,
                              builder: (context, bool value, _) {
                                return AnimatedPositioned(
                                  left: value ? 0 : size.width,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: PersonalInfoOverlay(
                                    constraints: constraints,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
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
