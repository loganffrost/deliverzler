import 'package:deliverzler/core/styles/app_themes/cupertino_custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/utils/validators.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class LoginTextFieldsSection extends StatelessWidget {
  const LoginTextFieldsSection({
    required this.emailController,
    required this.passwordController,
    required this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) {
        return Column(
          children: _sharedItemComponent(context),
        );
      },
      cupertino: (_, __) {
        return Column(
          children: [
            CupertinoFormSection.insetGrouped(
              decoration:
                  CupertinoCustomTheme.cupertinoFormSectionDecoration(context),
              backgroundColor: Colors.transparent,
              margin: EdgeInsets.zero,
              children: _sharedItemComponent(context),
            ),
            SizedBox(height: Sizes.textFieldVMarginDefault(context)),
          ],
        );
      },
    );
  }

  _sharedItemComponent(BuildContext context) {
    return [
      CustomTextField(
        context,
        key: const ValueKey('login_email'),
        hintText: tr(context).email,
        controller: emailController,
        validator: Validators.instance.validateEmail(context),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        suffixIcon: Icon(PlatformIcons(context).mail),
      ),
      CustomTextField(
        context,
        key: const ValueKey('login_password'),
        hintText: tr(context).password,
        controller: passwordController,
        validator: Validators.instance.validateLoginPassword(context),
        textInputAction: TextInputAction.go,
        obscureText: true,
        suffixIcon: const Icon(Icons.password),
        onFieldSubmitted: onFieldSubmitted,
      ),
    ];
  }
}
