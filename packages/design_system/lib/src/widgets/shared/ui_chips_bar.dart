
import 'package:design_system/design_system.dart';

class UIchipsBar extends StatefulWidget {
  UIchipsBar({super.key, required this.label});
  int? indexSelected = 0;
  final List<String> label;
  @override
  State<UIchipsBar> createState() => _UIchipsBarState();
}

class _UIchipsBarState extends State<UIchipsBar> {
  @override
  // List<String> labels = ['In Progress', 'Scheduled', 'Complete'];
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg, vertical: 2),
      height: UI.spacing.xl,
      color: UIColor.backgroundsilvar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: UIChipsWidget(
              labal: 'All',
              
              isSelect: widget.indexSelected == 0,
              onSelect: (value) {
                setState(() {
                  widget.indexSelected = 0;
                });
              },
            ),
          ),
          ...List.generate(
            widget.label.length,
            (i) => Expanded(
              child: SizedBox.expand(
                child: UIChipsWidget(
                  labal: widget.label[i],
                  isSelect: widget.indexSelected == i + 1,
                  onSelect: (value) {
                    setState(() {
                      widget.indexSelected = i + 1;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class UIChipsWidget extends StatefulWidget {
//   const UIChipsWidget({
//     super.key,
//     this.selectcolor,
//     this.color,
//     required this.labal,
//     required this.isSelect,
//     required this.onSelect,
//   });
//   final UIColor? selectcolor;
//   final UIColor? color;
//   final String labal;
//   final bool isSelect;
//   final ValueChanged onSelect;

//   @override
//   State<UIChipsWidget> createState() => _UIChipsWidgetState();
// }

// class _UIChipsWidgetState extends State<UIChipsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: UIText.headerBody(widget.labal),
//       onSelected: (value) {
//         setState(() {
//            widget.onSelect(value);
//         });

//       },
//       labelStyle: UI.text.headerBody,
//       backgroundColor: widget.color ?? UIColor.neutral100,
//       selected: widget.isSelect,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadiusGeometry.circular(UI.radius.sm),
//       ),
//       showCheckmark: false,

//       selectedColor: widget.selectcolor ?? UIColor.babyBlue,
//       side: BorderSide.none,
//     );
//   }
// }

class UIChipsWidget extends StatelessWidget {
  const UIChipsWidget({
    super.key,
    this.selectcolor,
    this.color,
    required this.labal,
    required this.isSelect,
    required this.onSelect,
  });

  final UIColor? selectcolor;
  final UIColor? color;
  final String labal;
  final bool isSelect;
  final ValueChanged<bool> onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(!isSelect),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: UI.spacing.xxs),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.md,
          vertical: UI.spacing.xxs,
        ),
        decoration: BoxDecoration(
          color:
              isSelect
                  ? (selectcolor ?? UIColor.babyBlue)
                  : (color ?? UIColor.neutral100),
          borderRadius: BorderRadius.circular(UI.radius.sm),
        ),
        child: UIText.buttonTextXsm(
          overflow: TextOverflow.clip,
          labal,
          color:  UIColor.black,
        ),
      ),
    );
  }
}

enum StatusMyOrderLabel { InProgress, Scheduled, Complete }