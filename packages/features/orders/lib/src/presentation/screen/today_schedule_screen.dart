import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';

class TodayScheduleScreen extends StatelessWidget {
  const TodayScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      body: CustomScrollView(
        slivers: [
          UISliverAppBar(  // TODO :delete app bar
            titleWidget: UIText.h4('Today’s Schedule'),
            centerTitle: true,
            variant: UISliverAppBarVariant.transparent,
          ),
          _buildSectionTitle(),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(UI.spacing.md, 0, UI.spacing.md, 0),
            sliver: SliverList.separated(itemBuilder: (context,i)=>TodayScheduleCard(), separatorBuilder: (context,_)=>SizedBox(height: UI.spacing.xs,),itemCount: 5,)
          )
          
        ],
      ),
      withBackgroundGradient: true,
    );
  }

  SliverToBoxAdapter _buildSectionTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: UI.spacing.xl,horizontal:UI.spacing.lg ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.h4('Today’s Schedule'),
            UIText.bodySmall('24 pickups'),
          ],
        ),
      ),
    );
  }
}

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.fromLTRB(UI.spacing.md,UI.spacing.md, UI.spacing.md, UI.spacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.bordarCard),
        color: UIColor.background,
        
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.h3('07:30 Pm'),
          SizedBox(height: UI.spacing.sm),
          UIText.bodyMedium('Address:',color: UIColor.textNatral600,),
          UIText.titleMd('125, 2nd street, California, 19288'),
          SizedBox(height: UI.spacing.sm,),
          OrderCleanerInfoWidget(name: 'meya Ali', rating: 5.0,),
          SizedBox(height: UI.spacing.md,),
          DirectionAndDoneActions()
        ],
      ),
    );
  }
}

class DirectionAndDoneActions extends StatelessWidget {
  const DirectionAndDoneActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UIButton.outlined(label:'Get direction',
          onPressed: (){},
          expanded: true,
          centerLabel: true,
          borderRadius: 4,
          labelColor: UIColor.black,
          borderColor: UIColor.bordarCard,
          backgroundColor: UIColor.background
          
          ),
        ),SizedBox(width: UI.spacing.xxs,),
        Expanded(child: UIButton.primary(label: 'Mark done',onPressed: (){},expanded: true)),
      ],
    );
  }
}
