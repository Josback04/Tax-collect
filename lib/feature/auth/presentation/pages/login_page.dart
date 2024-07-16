import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/core/utils/validator/name_validator.dart';
import 'package:tax_collect/core/utils/validator/password_validator.dart';
import 'package:tax_collect/core/widgets/show_loading.dart';
import 'package:tax_collect/core/widgets/show_snackbar.dart';
import 'package:tax_collect/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final packageInfo = GetIt.I<PackageInfo>();
  final focusNodeUsername = FocusNode();
  final focusNodePassword = FocusNode();
  final focusNodeSubmit = FocusNode();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state.loginState) {
                case AuthenticationState.loading:
                case AuthenticationState.processing:
                  showLoading(context);
                  break;
                case AuthenticationState.failure:
                  context.router.maybePop();
                  showSnackBar(
                    context,
                    text: context.tr(
                      state.message ?? LocaleKeys.error_happened,
                    ),
                    type: SnackBarType.danger,
                    hideCurrentSnackBar: false,
                  );
                  break;
                case AuthenticationState.authenticated:
                  context.router.maybePop();
                  context.router.replace(const MenuRoute());
                  break;
                case AuthenticationState.unauthenticated:
                default:
                  break;
              }
            },
            child: Builder(
              builder: (context) {
                return ListView(
                  children: [
                    const Gap(kSizeMd),
                    Column(
                      children: [
                        Container(
                          constraints: maxWidthConstraints,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(kSizeSm),
                              child: Column(
                                children: [
                                  Text(
                                    context.tr(LocaleKeys.connection),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Gap(kSizeLg),
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          focusNode: focusNodeUsername,
                                          controller: usernameTextController,
                                          decoration: InputDecoration(
                                            labelText:
                                                context.tr(LocaleKeys.username),
                                            hintText:
                                                context.tr(LocaleKeys.username),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: kSizeMdx,
                                                    vertical: kSizeMd),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kSizeMd)),
                                          ),
                                          onFieldSubmitted: (_) =>
                                              focusNodePassword.requestFocus(),
                                          validator: (value) =>
                                              const NameValidator.pure()
                                                  .validator(value ?? '')
                                                  ?.text(context),
                                        ),
                                        const Gap(kSizeMd),
                                        TextFormField(
                                          textInputAction: TextInputAction.send,
                                          focusNode: focusNodePassword,
                                          controller: passwordTextController,
                                          obscureText: !passwordVisible,
                                          decoration: InputDecoration(
                                            labelText:
                                                context.tr(LocaleKeys.password),
                                            hintText:
                                                context.tr(LocaleKeys.password),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: kSizeMdx,
                                                    vertical: kSizeMd),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kSizeMd)),
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  });
                                                }),
                                          ),
                                          validator: (value) =>
                                              const PasswordValidator.pure()
                                                  .validator(value ?? '')
                                                  ?.text(context),
                                          onFieldSubmitted: (password) {
                                            if (!formKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            context.read<AuthBloc>().add(
                                                  LoginEvent(
                                                    username:
                                                        usernameTextController
                                                            .text
                                                            .trim(),
                                                    password:
                                                        passwordTextController
                                                            .text
                                                            .trim(),
                                                  ),
                                                );
                                          },
                                        ),
                                        const Gap(kSizeLg),
                                        FilledButton(
                                          onPressed: () {
                                            if (!formKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            context.read<AuthBloc>().add(
                                                  LoginEvent(
                                                    username:
                                                        usernameTextController
                                                            .text
                                                            .trim(),
                                                    password:
                                                        passwordTextController
                                                            .text
                                                            .trim(),
                                                  ),
                                                );
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(kSizeMd),
                                            child: Text(
                                              LocaleKeys.login
                                                  .tr()
                                                  .toUpperCase(),
                                            ),
                                          ),
                                        ),
                                        const Gap(kSizeMd),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showBackDialog() {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Vous êtes sur le point de quitter?'),
            content: const Text('êtes vous sûr ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              )
            ],
          );
        });
  }
}
