import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/Core/helpers/space.dart';
import 'package:newapp/Core/theming/style.dart';
import 'package:newapp/Core/widgets/app_text_button.dart';
import 'package:newapp/Core/widgets/login_block_listener.dart';
import 'package:newapp/Features/login/logic/cubit/login_cubit.dart';
import 'package:newapp/Features/login/ui/widgets/already_have_acc_tec=xt.dart';
import 'package:newapp/Features/login/ui/widgets/divider.dart';
import 'package:newapp/Features/login/ui/widgets/email_and_pass.dart';
import 'package:newapp/Features/login/ui/widgets/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalspace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalspace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const EmailAndPass(),
                      verticalspace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalspace(40),
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalspace(60),
                      const Divider(),
                      verticalspace(60),
                      const TermsAndConditionsText(),
                      verticalspace(30),
                      const DontHaveAccount(),
                      const LoginBlockListener(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    print("FormKey: $formKey");
    if (formKey.currentState == null) {
      print("Form key is null");
      return;
    }

    if (!formKey.currentState!.validate()) {
      print("Form validation failed");
      return;
    }

    final loginCubit = context.read<LoginCubit>();
    print("LoginCubit: $loginCubit");
    if (loginCubit == null) {
      print("LoginCubit is null");
      return;
    }

    loginCubit.emitLoginState();
  }
}
