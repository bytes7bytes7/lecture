import 'package:flutter/material.dart';
import 'package:lecture/custom/custom_route_builder.dart';
import 'package:lecture/screens/home_screen.dart';
import 'package:lecture/widgets/confirm_code_row.dart';
import 'package:lecture/widgets/single_button.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      child: SizedBox(
                        height: Theme.of(context).textTheme.headline1!.fontSize,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              'Код подтверждения',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Введите код, который был выслан на электронную почту',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 20),
                          //ConfirmCodeRow(codeNotifier: ValueNotifier<String>('')),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: PinEntryTextField(
                              formKey: formKey,
                              cursorColor: Theme.of(context).primaryColor,
                              onSubmit: (value){
                                print(value);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SingleButton(
                              text: 'Далее',
                              onPressed: () {
                                if(formKey.currentState != null) {
                                  formKey.currentState!.validate();
                                }
                                // Navigator.of(context).push(
                                //   CustomRouteBuilder(
                                //     widget: const HomeScreen(),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ],
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
