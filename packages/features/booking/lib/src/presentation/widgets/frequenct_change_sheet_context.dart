import 'package:design_system/design_system.dart';

// class FrequencyChangeSheetContent extends StatelessWidget {
//   const FrequencyChangeSheetContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 520,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: UIColor.neutral100,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.xl)),
//       ),
//       // child: ListView(),
//     );
//   }
// }

class FrequencyChangeSheetContent extends StatefulWidget {
  const FrequencyChangeSheetContent({
    super.key,
    required this.initialValue,
    required this.onSubmit,
  });

  final FrequencyType initialValue;
  final ValueChanged<FrequencyType> onSubmit;

  @override
  State<FrequencyChangeSheetContent> createState() =>
      _FrequencyChangeSheetContentState();
}

class _FrequencyChangeSheetContentState
    extends State<FrequencyChangeSheetContent> {
  late List<FrequencyModel> items;

  @override
  void initState() {
    super.initState();

    items =
        [
          FrequencyModel(type: FrequencyType.oneTime, title: "One Time"),
          FrequencyModel(
            type: FrequencyType.biWeekly,
            title: "Every 2 weeks",
            badge: "10% off",
          ),
          FrequencyModel(
            type: FrequencyType.multiWeek,
            title: "Multiple times a week",
            badge: "up to 25% off",
          ),
        ].map((e) {
          return e.copyWith(isSelected: e.type == widget.initialValue);
        }).toList();
  }

  void onSelect(FrequencyType type) {
    setState(() {
      items = items.map((e) => e.copyWith(isSelected: e.type == type)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Choose your frequency",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 16),

        /// Items
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _FrequencyItem(
              model: item,
              onTap: () => onSelect(item.type),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// Submit
        UIButton.primary(
          label: 'Submit',
          expanded: true,
          onPressed: () {
            final selected = items.firstWhere((e) => e.isSelected);
            widget.onSubmit(selected.type);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

enum FrequencyType { oneTime, biWeekly, multiWeek }

class FrequencyModel {
  final FrequencyType type;
  final String title;
  final String? badge;
  final bool isSelected;

  const FrequencyModel({
    required this.type,
    required this.title,
    this.badge,
    this.isSelected = false,
  });

  FrequencyModel copyWith({bool? isSelected}) {
    return FrequencyModel(
      type: type,
      title: title,
      badge: badge,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class _FrequencyItem extends StatelessWidget {
  const _FrequencyItem({required this.model, required this.onTap});

  final FrequencyModel model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = model.isSelected;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF2FB), // light blue bg
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            /// Title
            Expanded(
              child: Row(
                children: [
                  Text(model.title, style: const TextStyle(fontSize: 14)),

                  if (model.badge != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFF5E1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        model.badge!,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            /// Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                ),
                // color: isSelected ? Colors.green : Colors.transparent,
              ),
              child:
                  isSelected
                      ? UIImage(
                        Assets.images.checkMark1.path,
                        key: const ValueKey('check'),
                        wigth: UI.sizes.iconMd,
                        height: UI.sizes.iconMd,
                        fit: BoxFit.contain,
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
