// ignore_for_file: unnecessary_import

import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/src/localization/profile_localization_scope.dart';
import 'package:util/util.dart';

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
    return UIScaffold(
      resizeToAvoidBottomInset: true,
      appBar: UIAppBar(
        titleWidget: UIText.h4(context.profileTranslation.option.help),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
              // height: 200,
              decoration: BoxDecoration(
                color: UIColor.surface,
                borderRadius: BorderRadius.circular(5),
                boxShadow: UI.shadows.md,
              ),
              child: TextFormField(
                //   TODO
                maxLines: 5,
                expands: false,
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
                style: UI.text.inputText.copyWith(color: UIColor.textPrimary),
              ),
              // child:UIText.bodyMedium('Write your note',color: UIColor.textNatral600,) ,
            ),
            SizedBox(height: UI.spacing.lg),

            // FormBuilder(
            //   key: _formKey,
            //   onChanged: _onValid(),
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   child: AppFormBuilderTextField(
            //     name: ProfileFormFieldNames.email,
            //     placeholder: context.profileTranslation.placeHolder.email,
            //     label: context.profileTranslation.Labels.email,

            //     validator: FormBuilderValidators.compose([
            //       // FormBuilderValidators.required(),
            //       FormBuilderValidators.email(),
            //     ]),
            //   ),
            // ),
            // SizedBox(height: UI.spacing.lg),
          ],
        ),
      ),
      bottomSheet: ValueListenableBuilder<bool>(
        valueListenable: _isFormValidNotifier,
        builder: (context, isValid, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),

            color: Colors.white,
            child: UIButton.primary(
              label: context.profileTranslation.Labels.send,
              onPressed: () async {
                DialogsManager.showLoading(context);
                await Future.delayed(Duration(milliseconds: 500));
                DialogsManager.hideLoading(context);
                context.pop();
                ToastificationUtil.success(
                  'Your message has sent successfully, ',
                );
              },
              expanded: true,
            ),
          );
        },
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
