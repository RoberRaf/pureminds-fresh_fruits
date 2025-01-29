import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/session_data.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/helpers/alerts.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/core/services/validators.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/general_widgets/main_text_field.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/main_layout/main_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black45,
                  Colors.transparent,
                ],
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.assetsPngAuthBg2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: ClipRRect(
                borderRadius: AppConsts.defaultRadius,
                child: ColoredBox(
                  color: Co.white,
                  child: Padding(
                    padding: AppConsts.defaultPadding,
                    child: Form(
                      key: formKey,
                      child: Column(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerticalSpacing(0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                L10n.tr().signIn,
                                style: TStyle.blackBold(22),
                              ),
                              IconButton(
                                onPressed: () => context.myPop(),
                                icon: const Icon(
                                  CupertinoIcons.clear_circled_solid,
                                  color: Co.black,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                          VerticalSpacing(30),
                          MainTextField(
                            controller: emailController,
                            hintText: L10n.tr().email,
                            validator: Validators.emailValidator,
                          ),
                          VerticalSpacing(10),
                          MainTextField(
                            controller: passwordController,
                            hintText: L10n.tr().password,
                            isPassword: true,
                            validator: Validators.moreThanSix,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                L10n.tr().forgotPassword,
                                style: TStyle.orangeRegular(15),
                              )),
                          VerticalSpacing(10),
                          MainButton(
                            text: L10n.tr().signIn.toUpperCase(),
                            ontap: () {
                              if (formKey.currentState?.validate() != true) return;
                              final user = SessionData.instance.user;
                              if (user?.email == emailController.text &&
                                  user?.token == passwordController.text) {
                                Alerts.showToast(L10n.tr().loginSuccessfully, error: false);
                                context.myPushReplacment(const MainLayout());
                              } else {
                                Alerts.showToast(L10n.tr().thisCredentialIsNotValid);
                              }
                              // context.myPush(const MainLayout());
                            },
                          ),
                          VerticalSpacing(20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
