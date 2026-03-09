// ignore_for_file: unnecessary_import

import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:profile/src/helper/profile_form_field_names.dart';
import 'package:profile/src/localization/profile_localization_scope.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: UIBackground(
        child: CustomScrollView(
          slivers: [
            UISliverAppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Padding(
                  padding: UI.padding.profileSupportAppBarDivider,
                  child: Divider(height: 4, color: UIColor.divider),
                ),
              ),
              variant: UISliverAppBarVariant.transparent,
              leading: BackButtonAppBar(),
              centerTitle: true,
              titleWidget: UIText.h4(context.profileTranslation.option.help),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: UI.padding.profileSupportContent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.bodyLarge(
                      overflow: TextOverflow.clip,
                      color: UIColor.textNatral600,
                      'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat.',
                    ),
                    SizedBox(height: UI.spacing.lg),
                    Container(
                      padding: UI.padding.allMd,
                      width: double.infinity,
                      height: h * 0.3,
                      decoration: BoxDecoration(
                        color: UIColor.surface,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: UI.shadows.md,
                      ),
                      child: TextFormField(
                        //   TODO
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: context.profileTranslation.placeHolder.note,
                          hintStyle: UI.text.inputPlaceholder.copyWith(
                            color: UIColor.textPlaceholder,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: UI.text.inputText.copyWith(
                          color: UIColor.textPrimary,
                        ),
                      ),
                      // child:UIText.bodyMedium('Write your note',color: UIColor.textNatral600,) ,
                    ),
                    SizedBox(height: UI.spacing.lg),

                    FormBuilder(
                      key: _formKey,
                      onChanged: _onValid(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          AppFormBuilderTextField(
                            name: ProfileFormFieldNames.email,
                            placeholder:
                                context.profileTranslation.placeHolder.email,
                            label: context.profileTranslation.Labels.email,

                            validator: FormBuilderValidators.compose([
                              // FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: UI.spacing.lg),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isFormValidNotifier,
                      builder: (context, isValid, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: w * 0.42,
                              height: h * 0.1,
                              child: UIButton.primary(
                                label: context.profileTranslation.Labels.send,

                                onPressed: () {},
                                expanded: false,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: strict_top_level_inference
  _onValid() {
    final isValid = _formKey.currentState?.isValid ?? false;
    if (_isFormValidNotifier.value != isValid) {
      _isFormValidNotifier.value = isValid;
    }
  }
}
