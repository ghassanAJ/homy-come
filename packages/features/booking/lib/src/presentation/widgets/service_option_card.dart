import 'package:booking/booking.dart';

class AddOnCard extends StatelessWidget {
  const AddOnCard({
    super.key,
    required this.data,
    required this.onAddButtonPressed,
    this.selected = false,
  });

  final AddOnServiceModel data;
  final VoidCallback onAddButtonPressed;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          UIBottomSheet.show(context: context, content: _buildBottomSheet());
        },
        child: Container(
          padding: EdgeInsets.all(UI.spacing.sm),
          decoration: BoxDecoration(
            color: UIColor.background,
            border: Border(bottom: BorderSide(color: UIColor.divider)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(UI.radius.sm),
                child: Container(
                  width: 74,
                  height: 74,
                  color: UIColor.neutral100,
                  child: UINetworkImage(
                    imageUrl: data.info.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: UI.spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.bodySmall(
                      data.info.name ?? '',
                      fontWeight: FontWeight.w700,
                      color: UIColor.balck,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    UIText.caption(
                      '${data.durationMinutes.toString() ?? ''} min',
                      color: UIColor.textSecondary,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    UIText.bodySmall(
                      '\u2022 ${data.info.description ?? ''}',
                      color: UIColor.balck,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    Row(
                      children: [
                        UIPriceText(
                          isOldPrice: true,
                          text: UIText.bodySmallBold(
                            data.price.newPrice.toString() ?? '',
                            // color: UIColor.textGray,
                          ),
                          oldPrice: data.price.newPrice.toString() ?? '',
                        ),
                        // SizedBox(width: UI.spacing.xxs),
                        // UIPriceText(
                        //   text: UIText.bodySmallBold(
                        //     data.price.currentPrice.toString() ?? '',
                        //     color: UIColor.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              if (true) ...[
                SizedBox(width: UI.spacing.sm),
                _buildAddButton(false, selected),
              ],
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<BookingWizardBloc, BookingWizardState> _buildBottomSheet() {
    return BlocBuilder<BookingWizardBloc, BookingWizardState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: SizedBox(
                width: double.infinity,
                child: UINetworkImage(
                  imageUrl: data.info.image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12),

            UIText.bodyMedium(data.info.name, fontWeight: FontWeight.w600),
            SizedBox(height: 6),
            UIText.caption(data.info.description ?? ''),
            SizedBox(height: 12),
            UIText.bodyMedium("What’s included:", fontWeight: FontWeight.w600),
            UIText.bodySmall("- Cleaning of surfaces with a washcloth."),
            UIText.bodySmall("- Washout & mopping of the floor."),
            UIText.bodySmall("- Interior Cleaning."),
            SizedBox(height: 12),
            _buildAddButton(true, state.selectedAddOns.contains(data)),
          ],
        );
      },
    );
  }

  IconButton _buildAddButton(bool isExpanded, bool isSelected) {
    return IconButton(
      hoverColor: UIColor.babyBlue.withValues(alpha: 0.1),
      splashColor: UIColor.babyBlue.withValues(alpha: 0.1),
      highlightColor: UIColor.babyBlue.withValues(alpha: 0.1),
      onPressed: onAddButtonPressed,
      icon: Container(
        width: isExpanded ? double.infinity : null,
        padding: EdgeInsets.all(UI.spacing.xs),
        decoration: BoxDecoration(
          color: isSelected ? UIColor.softGreen : UIColor.babyBlue,
          borderRadius: BorderRadius.circular(UI.radius.lg),
        ),
        child:
            isExpanded
                ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: UI.spacing.xs),
                    child: UIText.bodySmall(
                      isSelected ? 'Added' : 'Add',
                      fontWeight: isExpanded ? FontWeight.w600 : null,
                    ),
                  ),
                )
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.xs),
                  child: UIText.bodySmall(isSelected ? 'Added' : 'Add'),
                ),
      ),
    );
  }
}
