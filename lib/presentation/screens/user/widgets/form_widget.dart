// ignore_for_file: must_be_immutable

import 'package:bloc_state_managment/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../widgets/text_field_widget.dart';

enum Forms { username, email, phone, password, code, promoCode }

class FormWidget extends StatelessWidget {
  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? phoneController;
  TextEditingController? codeController;
  TextEditingController? promoCodeController;
  final String route;

  FormWidget({
    Key? key,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.usernameController,
    this.codeController,
    this.promoCodeController,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _forms(),
    );
  }

  List<Widget> _forms() {
    if (route == Routes.loginScreen) {
      return [
        textFields(Forms.email),
        const SizedBox(height: MySizes.verticalPadding),
        textFields(Forms.password),
      ];
    }
    if (route == Routes.registerScreen) {
      return [
        textFields(Forms.username),
        const SizedBox(height: MySizes.verticalPadding),
        textFields(Forms.email),
        const SizedBox(height: MySizes.verticalPadding),
        textFields(Forms.phone),
        const SizedBox(height: MySizes.verticalPadding),
        textFields(Forms.password),
      ];
    }
    if (route == Routes.verifyEmailScreen) {
      return [
        textFields(Forms.email),
      ];
    }
    if (route == Routes.verifyCodeScreen) {
      return [
        textFields(Forms.code),
      ];
    }
    if (route == Routes.resetPasswordScreen) {
      return [
        textFields(Forms.password),
      ];
    }
    return [
      textFields(Forms.username),
    ];
  }

  Widget textFields(Forms e) {
    switch (e) {
      case Forms.username:
        return TextFieldWidget(
          controller: passwordController!,
          hint: 'Enter password',
          keyboard: TextInputType.text,
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          validator: () {},
        );
      case Forms.email:
        return TextFieldWidget(
          controller: emailController!,
          hint: 'Enter email',
          keyboard: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          validator: () {},
        );
      case Forms.phone:
        return TextFieldWidget(
          controller: phoneController!,
          hint: 'Enter phone',
          keyboard: TextInputType.phone,
          prefixIcon: Icons.phone,
          validator: () {},
        );
      case Forms.password:
        return TextFieldWidget(
          controller: passwordController!,
          hint: 'Enter password',
          keyboard: TextInputType.text,
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          validator: () {},
        );
      case Forms.code:
        return Container();
      case Forms.promoCode:
        return Container();
      default:
        return Container();
    }
  }
}
