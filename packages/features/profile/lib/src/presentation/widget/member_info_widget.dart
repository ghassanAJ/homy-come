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

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox.square(
                dimension: 64,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Avatar(
                    size: AvatarSize.large,
                    imageUrl: '',
                    placeholderWidget: Container(color: UIColor.neutral100),
                  ),
                ),
              ),
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
                  SizedBox(height: UI.spacing.xxs),
                  UIText.h5(
                    item.status,
                    overflow: TextOverflow.ellipsis,
                    color: UIColor.success,
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






