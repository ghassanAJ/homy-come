import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h3('Home Cleaning', color: UIColor.balck),
            UIText.bodySmall('Step 1 to 4', color: UIColor.textSecondary),
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
            padding: EdgeInsets.fromLTRB(
              UI.spacing.lg,
              topContentPadding,
              UI.spacing.lg,
              140,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  'How Many Hours do you need your professional to stay ?',
                ),
                SizedBox(height: UI.spacing.md),
                Wrap(
                  spacing: UI.spacing.xs,
                  runSpacing: UI.spacing.xs,
                  children: List.generate(
                    7,
                    (index) => _CircleNumberOption(
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
                SizedBox(height: UI.spacing.lg),
                _SectionTitle('How Many professional do you need ?'),
                SizedBox(height: UI.spacing.md),
                Wrap(
                  spacing: UI.spacing.xs,
                  runSpacing: UI.spacing.xs,
                  children: [
                    _ChoiceChipButton(
                      label: 'One Professional',
                      selected:
                          _selectedProfessionalCount == 'One Professional',
                      onTap: () {
                        setState(() {
                          _selectedProfessionalCount = 'One Professional';
                        });
                      },
                    ),
                    _ChoiceChipButton(
                      label: '2 to 4',
                      selected: _selectedProfessionalCount == '2 to 4',
                      onTap: () {
                        setState(() {
                          _selectedProfessionalCount = '2 to 4';
                        });
                      },
                    ),
                    _ChoiceChipButton(
                      label: '4 to 6',
                      selected: _selectedProfessionalCount == '4 to 6',
                      onTap: () {
                        setState(() {
                          _selectedProfessionalCount = '4 to 6';
                        });
                      },
                    ),
                    _ChoiceChipButton(
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
                _SectionTitle('Need cleaning materials?'),
                SizedBox(height: UI.spacing.md),
                Wrap(
                  spacing: UI.spacing.xs,
                  children: [
                    _ChoiceChipButton(
                      label: 'No, i have them',
                      selected: _selectedMaterials == 'No, i have them',
                      onTap: () {
                        setState(() {
                          _selectedMaterials = 'No, i have them';
                        });
                      },
                    ),
                    _ChoiceChipButton(
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
                _SectionTitle('Any Notes ?'),
                SizedBox(height: UI.spacing.sm),
                TextField(
                  controller: _notesController,
                  maxLines: 4,
                  style: UI.text.bodyMedium.copyWith(color: UIColor.balck),
                  inputFormatters: [LengthLimitingTextInputFormatter(400)],
                  decoration: InputDecoration(
                    hintText: 'add your notes',
                    hintStyle: UI.text.bodyMedium.copyWith(
                      color: UIColor.neutral500,
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
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(UI.spacing.md),
                decoration: BoxDecoration(
                  color: UIColor.background,
                  borderRadius: BorderRadius.circular(UI.radius.lg),
                  boxShadow: UI.shadows.cardMd,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total 78.00 AED',
                            style: UI.text.bodyMedium.copyWith(
                              color: UIColor.neutral300,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          UIText.h4('48.00AED', color: UIColor.balck),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 128,
                      child: UIButton.primary(
                        label: 'Next',
                        expanded: true,
                        onPressed: () {
                          context.push(UserPaths.serviceDetails2);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return UIText.h3(title, color: UIColor.balck, maxLines: 2);
  }
}

class _CircleNumberOption extends StatelessWidget {
  const _CircleNumberOption({
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final int value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? UIColor.softGreen : UIColor.background,
          border: Border.all(
            color: selected ? UIColor.softGreen : UIColor.neutral200,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: UIText.bodyMedium(
          '$value',
          fontWeight: FontWeight.w600,
          color: selected ? UIColor.background : UIColor.balck,
        ),
      ),
    );
  }
}

class _ChoiceChipButton extends StatelessWidget {
  const _ChoiceChipButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.md,
          vertical: UI.spacing.xs,
        ),
        decoration: BoxDecoration(
          color: selected ? UIColor.babyPink : UIColor.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: selected ? UI.shadows.sm : null,
        ),
        child: UIText.bodyMedium(
          label,
          fontWeight: FontWeight.w700,
          color: selected ? UIColor.pink : UIColor.neutral500,
        ),
      ),
    );
  }
}
