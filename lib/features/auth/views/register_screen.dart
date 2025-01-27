import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/core/services/validators.dart';
import 'package:pure_minds/features/auth/views/widgets/register_success_dialog.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/general_widgets/main_text_field.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 430,
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
                image: AssetImage(Assets.assetsPngAuthBg),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const VerticalSpacing(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                L10n.tr().createYourAccount,
                                style: TStyle.blackBold(20),
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
                          const VerticalSpacing(45),
                          Row(
                            children: [
                              Expanded(
                                child: MainTextField(
                                  controller: firstNameController,
                                  hintText: L10n.tr().firstName,
                                  validator: Validators.notEmpty,
                                ),
                              ),
                              const HorizontalSpacing(16),
                              Expanded(
                                child: MainTextField(
                                  controller: lastNameController,
                                  hintText: L10n.tr().lastName,
                                  validator: Validators.notEmpty,
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(20),
                          MainTextField(
                            controller: emailController,
                            hintText: L10n.tr().email,
                            validator: Validators.emailValidator,
                          ),
                          const VerticalSpacing(20),
                          MainTextField(
                            controller: passwordController,
                            hintText: L10n.tr().password,
                            isPassword: true,
                            validator: Validators.moreThanSix,
                          ),
                          const VerticalSpacing(25),
                          Text(
                            L10n.tr().byTappingSignUp,
                            style: TStyle.blackRegular(14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                                child: Text(
                                  L10n.tr().terms,
                                  style: TStyle.orangeRegular(14).copyWith(
                                    // decoration: TextDecoration.underline,
                                    // decorationColor: Colors.black38,
                                  ),
                                ),
                              ),
                              Text(
                                "  ${L10n.tr().and}  ",
                                style: TStyle.blackRegular(14),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                                child: Text(
                                  L10n.tr().conditions,
                                  style: TStyle.orangeRegular(14).copyWith(
                                    // decoration: TextDecoration.underline,
                                    // decorationColor: Colors.black38,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(25),
                          MainButton(
                            text: L10n.tr().createAnAccount.toUpperCase(),
                            ontap: () {
                              if (formKey.currentState?.validate() != true) return;
                              showDialog(
                                context: context,
                                barrierColor: Colors.black26,
                                builder: (context) {
                                  return RegisterSuccessDialog(
                                    name: '${firstNameController.text} ${lastNameController.text}',
                                  );
                                },
                              );
                            },
                          ),
                          const VerticalSpacing(15),
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
