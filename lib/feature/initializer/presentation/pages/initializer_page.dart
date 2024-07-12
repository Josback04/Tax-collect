import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/feature/initializer/presentation/bloc/initializer_bloc.dart';
import 'package:tax_collect/generated/assets.gen.dart';

@RoutePage()
class InitializerPage extends StatefulWidget {
  const InitializerPage({super.key});

  @override
  State<InitializerPage> createState() => _InitializerPageState();
}

class _InitializerPageState extends State<InitializerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var splashScreenDuration = const Duration(milliseconds: 1700);

  @override
  void initState() {
    super.initState();
    splashImageAnimation();
    context.read<InitializerBloc>().add(const GetUserLoginEvent());
  }

  splashImageAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: splashScreenDuration,
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializerBloc, InitializerState>(
      listener: (context, state) {
        bool? isLogin = state.isLogin;
        print('login check');
        if (isLogin != null && isLogin == true) {
          print('login true');
          Timer(splashScreenDuration, () {
            context.router.replace(const MenuRoute());
          });
        } else {
          print('login false');
          Timer(splashScreenDuration, () {
            context.router.replace(const LoginRoute());
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ScaleTransition(
              scale: animation,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  child: Assets.images.tax.image(
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
