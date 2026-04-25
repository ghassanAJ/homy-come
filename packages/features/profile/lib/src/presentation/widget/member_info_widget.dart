import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/presentation/widget/shared/call_chat_row_widget.dart';

class MemeberInfoWidget extends StatelessWidget {
  const MemeberInfoWidget({super.key, required this.item});
  final MyteamMemberModel item;
  @override
  Widget build(BuildContext context) {
    final tr = context.profileTranslation;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: UIColor.babyPink,
                  border: Border.all(color: UIColor.primary, width: 1),
                ),
                child: UINetworkImage(imageUrl: item.imageUrl),
              ),
              // SizedBox.square(
              //   dimension: 64,
              //   child: FittedBox(
              //     fit: BoxFit.contain,
              //     child: Avatar(
              //       size: AvatarSize.large,
              //       imageUrl: item.imageUrl,
              //       placeholderWidget: Container(color: UIColor.neutral100),
              //     ),
              //   ),
              // ),
              SizedBox(width: UI.spacing.sm),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: UIText.bodyBold(
                      item.nameMember,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  UIText.h5(
                    item.status,
                    overflow: TextOverflow.ellipsis,
                    color:
                        item.status == 'working'
                            ? UIColor.success
                            : UIColor.neutral400,
                  ),
                ],
              ),
            ],
          ),
          CallAndChatWidget(number: item.phone),
        ],
      ),
    );
  }
}
