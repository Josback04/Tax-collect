import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/widgets/card_inkwell.dart';
import 'package:tax_collect/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/generated/assets.gen.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? username;

  @override
  void initState() {
    context.read<AuthBloc>().add(const GetUserEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(kSizeSm),
          children: [
            const Gap(kSizeMdx),
            Card(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  username = state.username;
                  return ListTile(
                    leading: Assets.images.tax
                        .image(height: kSizeXXLg, fit: BoxFit.scaleDown),
                    title: Text(
                        '${context.tr(LocaleKeys.hello)} ${username != null ? " $username" : ''}'),
                    subtitle: Text(context.tr(LocaleKeys.welcome_to_app_name)),
                  );
                },
              ),
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                var printerSelected = state.selectedPrinterDevice;
                logger.w('printer = $printerSelected');
                return Visibility(
                  visible: printerSelected == null,
                  child: Card(
                    color: Colors.red,
                    child: ListTile(
                      leading: const Icon(
                        Icons.print_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        context.tr(LocaleKeys.printer_not_setup),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      trailing: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onTap: () => context.router.push(PrinterConfigRoute()),
                    ),
                  ),
                );
              },
            ),
            const Gap(kSizeMdx),
            ResponsiveStaggeredGridList(
              desiredItemWidth: 150,
              children: [
                CardMenu(
                  imagePath: Assets.images.ticket.path,
                  title: context.tr(LocaleKeys.ticket),
                  route: const TicketRoute(),
                ),
                CardMenu(
                  imagePath: Assets.images.history.path,
                  title: context.tr(LocaleKeys.history),
                  route: const HistoryRoute(),
                ),
                CardMenu(
                  imagePath: Assets.images.report.path,
                  title: context.tr(LocaleKeys.report),
                  route: const ReportRoute(),
                ),
                CardMenu(
                  imagePath: Assets.images.setting.path,
                  title: context.tr(LocaleKeys.setting),
                  route: const SettingsRoute(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  final String imagePath;
  final String title;
  final PageRouteInfo<dynamic> route;

  const CardMenu({
    super.key,
    required this.imagePath,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return CardInkWell(
      onTap: () {
        context.pushRoute(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(kSizeSm),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 150,
            ),
            const Gap(kSizeMd),
            AutoSizeText(
              context.tr(title),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
