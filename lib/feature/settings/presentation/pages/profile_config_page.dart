import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../../../../core/config/route/app_router.dart';

@RoutePage()
class ProfileConfigPage extends StatefulWidget {
  const ProfileConfigPage({super.key});

  @override
  State<ProfileConfigPage> createState() => _ProfileConfigPageState();
}

class _ProfileConfigPageState extends State<ProfileConfigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.profile))),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                const Gap(kSizeSm),
                Container(
                  constraints: maxWidthConstraints,
                  padding: const EdgeInsets.all(kSizeMd),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.verified_user),
                          title: const Text(
                              //state.userLogin?.username ??
                              "-"),
                          subtitle: Text(context.tr(LocaleKeys.username)),
                        ),
                        // Visibility(
                        //   // visible: state.contactLogin?.lastname != null,
                        //   child: ListTile(
                        //     leading: const Icon(Icons.person),
                        //     title: const Text(
                        //         //state.contactLogin?.lastname ??
                        //         "-"),
                        //     subtitle: Text(context.tr(LocaleKeys.lastname)),
                        //   ),
                        // ),
                        // Visibility(
                        //   // visible: state.contactLogin?.middlename != null,
                        //   child: ListTile(
                        //     leading: const Icon(Icons.person),
                        //     title: const Text(
                        //         //state.contactLogin?.middlename ??
                        //         "-"),
                        //     subtitle: Text(context.tr(LocaleKeys.middlename)),
                        //   ),
                        // ),
                        // Visibility(
                        //   // visible: state.contactLogin?.firstname != null,
                        //   child: ListTile(
                        //     leading: const Icon(Icons.person),
                        //     title: const Text(
                        //         //state.contactLogin?.firstname ??
                        //
                        //         "-"),
                        //     subtitle: Text(context.tr(LocaleKeys.firstname)),
                        //   ),
                        // ),
                        Visibility(
                          // visible: state.contactLogin?.birthdate != null,
                          child: ListTile(
                            leading: const Icon(Icons.cake),
                            title: const Text(
                                //state.contactLogin?.birthdate?.toIso8601String() ??
                                "-"),
                            subtitle: Text(context.tr(LocaleKeys.birthdate)),
                          ),
                        ),
                        // Visibility(
                        //   // visible: state.contactLogin?.birthplace != null,
                        //   child: ListTile(
                        //     leading: const Icon(Icons.place),
                        //     title: const Text(
                        //         //state.contactLogin?.birthplace ??
                        //         "-"),
                        //     subtitle: Text(context.tr(LocaleKeys.birthplace)),
                        //   ),
                        // ),
                        const Divider(),
                        Visibility(
                          //  visible: state.contactLogin == null,
                          child: ListTile(
                            leading: const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            title: Text(
                              context.tr(LocaleKeys.contact_info_missing),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            //subtitle: Text(context.tr(LocaleKeys.password)),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.mail),
                          title: const Text(
                              //state.contactLogin?.email ?? state.userLogin?.email ??
                              "-"),
                          subtitle: Text(context.tr(LocaleKeys.email)),
                          //TODO: edit email
                          //trailing:const Icon(Icons.edit),
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: const Text(
                              //state.contactLogin?.phone ?? state.userLogin?.phone ??
                              "-"),
                          subtitle: Text(context.tr(LocaleKeys.phone)),
                          //TODO: edit phone
                          // trailing:const Icon(Icons.edit),
                        ),
                        Visibility(
                          //visible: state.contactLogin?.phone2 != null,
                          child: ListTile(
                            leading: const Icon(Icons.phone_iphone),
                            title: const Text(
                                //state.contactLogin?.phone2 ??
                                "-"),
                            subtitle: Text(context.tr(LocaleKeys.phone2)),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.lock),
                          title: const Text('* * * * * * *'),
                          subtitle: Text(context.tr(LocaleKeys.password)),
                          //TODO: edit password
                          //  trailing:const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(kSizeMd),
                Container(
                  constraints: maxWidthConstraints,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () async {
                      //TODO: Make a use case for logout
                      context.router.replaceAll([const LoginRoute()]);
                      await GetIt.I<SharedPreferences>().clear();
                      await Future.delayed(const Duration(seconds: 2));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(kSizeMd),
                      child: Text(
                        context.tr(LocaleKeys.logout).toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
