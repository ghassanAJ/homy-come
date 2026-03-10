
import 'package:design_system/design_system.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/shared/call_chat_row_widget.dart';

class MemeberInfoWidget extends StatelessWidget {
  const MemeberInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.profileTranslation;
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: SizedBox(
        width: UI.sizes.avatarLg,
        height: UI.sizes.avatarLg,
        child: Avatar(
          size: AvatarSize.large,
          imageUrl: '',
          placeholderWidget: Container(color: UIColor.neutral100),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.bodyBold('Samia mohammad', overflow: TextOverflow.ellipsis),
          SizedBox(height: UI.spacing.xxs),
          UIText.h5(
           tr.profile.working ,
            overflow: TextOverflow.ellipsis,
            color: UIColor.success,
          ),
        ],
      ),
      trailing: CallAndChatWidget(),
    );
  }
}
