import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/booking/presentation/widgets/choice_chip_button.dart';
import 'package:user/features/booking/presentation/widgets/circle_number_option.dart';
import 'package:user/features/booking/presentation/widgets/step_navigation_bar.dart';
import 'package:user/navigation/route.dart';

class ServiceDetailsScreenStep1 extends StatefulWidget {
  const ServiceDetailsScreenStep1({super.key});

  @override
  State<ServiceDetailsScreenStep1> createState() =>
      _ServiceDetailsScreenStep1State();
}

class _ServiceDetailsScreenStep1State extends State<ServiceDetailsScreenStep1> {
  int _selectedHours = 1;
  String _selectedProfessionalCount = 'One Professional';
  String _selectedMaterials = 'No, i have them';
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Widget ___sectionTitle(String title){
    return  UIText.h6(title, color: UIColor.balck, maxLines: 2);
  }

  
  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h4('Home Cleaning', color: UIColor.balck),
            UIText.bodyMedium('Step 1 to 4', color: UIColor.textSecondary),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          child: const BackButtonAppBar(),
        ),
      ),
      withBackgroundGradient: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, UI.sizes.bottomPadding),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    UI.spacing.lg,
                    topContentPadding,
                    UI.spacing.xxs,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ___sectionTitle(
                        'How Many Hours do you need your professional to stay ?',
                      ),
                      SizedBox(height: UI.spacing.sm),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: UI.spacing.xs,
                          runSpacing: UI.spacing.xs,
                          children: List.generate(
                            7,
                            (index) => CircleNumberOptionWidget(
                              value: index + 1,
                              selected: _selectedHours == index + 1,
                              onTap: () {
                                setState(() {
                                  _selectedHours = index + 1;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: UI.spacing.lg),
                      ___sectionTitle('How Many professional do you need ?'),
                      SizedBox(height: UI.spacing.sm),
                      Wrap(
                        spacing: UI.spacing.xs,
                        runSpacing: UI.spacing.xs,
                        children: [
                          ChoiceChipButtonWidget(
                            label: 'One Professional',
                            selected:
                                _selectedProfessionalCount ==
                                'One Professional',
                            onTap: () {
                              setState(() {
                                _selectedProfessionalCount = 'One Professional';
                              });
                            },
                          ),
                          ChoiceChipButtonWidget(
                            label: '2 to 4',
                            selected: _selectedProfessionalCount == '2 to 4',
                            onTap: () {
                              setState(() {
                                _selectedProfessionalCount = '2 to 4';
                              });
                            },
                          ),
                          ChoiceChipButtonWidget(
                            label: '4 to 6',
                            selected: _selectedProfessionalCount == '4 to 6',
                            onTap: () {
                              setState(() {
                                _selectedProfessionalCount = '4 to 6';
                              });
                            },
                          ),
                          ChoiceChipButtonWidget(
                            label: 'More than',
                            selected: _selectedProfessionalCount == 'More than',
                            onTap: () {
                              setState(() {
                                _selectedProfessionalCount = 'More than';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: UI.spacing.lg),
                      ___sectionTitle('Need cleaning materials?'),
                      SizedBox(height: UI.spacing.sm),
                      Wrap(
                        spacing: UI.spacing.xs,
                        children: [
                          ChoiceChipButtonWidget(
                            label: 'No, i have them',
                            selected: _selectedMaterials == 'No, i have them',
                            onTap: () {
                              setState(() {
                                _selectedMaterials = 'No, i have them';
                              });
                            },
                          ),
                          ChoiceChipButtonWidget(
                            label: 'yes please',
                            selected: _selectedMaterials == 'yes please',
                            onTap: () {
                              setState(() {
                                _selectedMaterials = 'yes please';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: UI.spacing.lg),
                      ___sectionTitle('Any Notes ?'),
                      SizedBox(height: UI.spacing.sm),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                  child: TextField(
                    controller: _notesController,
                    maxLines: 4,
                    style: UI.text.bodyMedium.copyWith(color: UIColor.balck),
                    inputFormatters: [LengthLimitingTextInputFormatter(400)],
                    decoration: InputDecoration(
                      hintText: 'add your notes',
                      hintStyle: UI.text.bodyMedium.copyWith(
                        color: UIColor.grey,
                      ),
                      filled: true,
                      fillColor: UIColor.background,
                      contentPadding: EdgeInsets.all(UI.spacing.md),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(UI.radius.lg),
                        borderSide: BorderSide(color: UIColor.neutral200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(UI.radius.lg),
                        borderSide: BorderSide(color: UIColor.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            minimum: EdgeInsets.fromLTRB(
              UI.spacing.lg,
              UI.spacing.sm,
              UI.spacing.lg,
              UI.spacing.sm,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: StepNavigationBar(
                next: () {
                  context.push(UserPaths.serviceDetails2);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




