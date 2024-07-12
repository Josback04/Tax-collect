import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/feature/ticket/domain/entities/vehicule_type_entity.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:tax_collect/feature/ticket/presentation/widgets/show_payment_method_picker_dialog.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../../../../core/utils/validator/name_validator.dart';

@RoutePage()
class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final plateTextEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final focusNodeVehiculeDropDown = FocusNode();
  final focusNodePlateNumberText = FocusNode();
  final focusNodeSubmit = FocusNode();

  // List of items in the dropdown
  final List<VehiculeTypeEntity> dropdownItems = [
    const VehiculeTypeEntity(id: 1, type: 'moto', price: 500),
    const VehiculeTypeEntity(id: 2, type: 'taxi', price: 1000),
    const VehiculeTypeEntity(id: 3, type: 'bus', price: 1500),
  ];

  @override
  void initState() {
    context.read<TicketBloc>().add(const InitTicketEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.ticket)),
      ),
      body: SafeArea(
        child: BlocListener<TicketBloc, TicketState>(
          listener: (context, state) {
            switch (state.blocState) {
              case BlocState.success:
                plateTextEditController.clear();
                break;
              case BlocState.initial:
              case BlocState.loading:
              case BlocState.failed:
              default:
                break;
            }
          },
          child: BlocBuilder<TicketBloc, TicketState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(kSizeMd),
                children: [
                  ConstrainedBox(
                    constraints: maxWidthConstraints,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          DropdownButtonFormField<VehiculeTypeEntity?>(
                            focusNode: focusNodeVehiculeDropDown,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: kSizeMdx, vertical: kSizeMd),
                                hintText: context.tr(LocaleKeys.please_select),
                                labelText: context
                                    .tr(LocaleKeys.select_vehicule_type)),
                            value: state.selectedVehiculeTypeEntity,
                            validator: (val) {
                              if (val == null) {
                                return context
                                    .tr(LocaleKeys.please_select_vehicule);
                              }
                              return null;
                            },
                            onChanged: (VehiculeTypeEntity? newValue) {
                              if (newValue != null) {
                                context.read<TicketBloc>().add(
                                      SelectVehiculeEvent(
                                        vehiculeTypeEntity: newValue,
                                      ),
                                    );
                                focusNodePlateNumberText.requestFocus();
                              }
                            },
                            items: dropdownItems
                                .map<DropdownMenuItem<VehiculeTypeEntity?>>(
                                    (VehiculeTypeEntity? value) {
                              return DropdownMenuItem<VehiculeTypeEntity?>(
                                value: value,
                                child: Text(value?.type?.toUpperCase() ??
                                    context
                                        .tr(LocaleKeys.select_vehicule_type)),
                              );
                            }).toList(),
                          ),
                          const Gap(kSizeMd),
                          Text(
                            "${context.tr(LocaleKeys.price)}: ${state.selectedVehiculeTypeEntity?.price.toStringAsMinFixed(1) ?? '. . .'} CDF",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Gap(kSizeMd),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            focusNode: focusNodePlateNumberText,
                            controller: plateTextEditController,
                            decoration: InputDecoration(
                              labelText: context.tr(LocaleKeys.plate_number),
                              hintText: context.tr(LocaleKeys.plate_number),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: kSizeMdx, vertical: kSizeMd),
                              border: const OutlineInputBorder(),
                            ),
                            textCapitalization: TextCapitalization.characters,
                            onFieldSubmitted: (_) =>
                                focusNodeSubmit.requestFocus(),
                            validator: (value) => const NameValidator.pure()
                                .validator(value ?? '', plateNumber: true)
                                ?.text(context),
                            onChanged: (value) {
                              context.read<TicketBloc>().add(
                                    EnterPlateNumberEvent(
                                      plate: value,
                                    ),
                                  );
                            },
                          ),
                          const Gap(kSizeLg),
                          FilledButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              showPaymentMethodPickerDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(kSizeMd),
                              child: Text(
                                LocaleKeys.next.tr().toUpperCase(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
