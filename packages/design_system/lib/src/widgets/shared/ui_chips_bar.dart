import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:design_system/src/widgets/shared/interaction_chips_bar_widget.dart';

class UIchipsBar extends StatefulWidget {
  UIchipsBar({super.key, required this.label, this.firstLabel});
  int? indexSelected = 0;
  final List<String> label;
  final String? firstLabel;
  @override
  State<UIchipsBar> createState() => _UIchipsBarState();
}

class _UIchipsBarState extends State<UIchipsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg, vertical: 2),
      height: UI.spacing.xl,
      color: UIColor.backgroundsilvar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.firstLabel != null)
            SizedBox(
              child: InteractiveChipsBar(
                labal: widget.firstLabel!,

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
                child: InteractiveChipsBar(
                  labal: widget.label[i],
                  isSelect: widget.indexSelected == i + 1,
                  onSelect: (value) {
                    setState(() {
                      widget.indexSelected = i + 1;
                      log(widget.indexSelected.toString());
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

enum StatusMyOrderLabel { InProgress, Scheduled, Complete }
