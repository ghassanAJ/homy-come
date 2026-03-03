import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:notifications/src/presentation/cubit/notifications_cubit.dart';
import 'package:notifications/src/presentation/widgets/notification_section.dart';
import 'package:notifications/src/presentation/widgets/notifications_header_app_bar.dart';
import 'package:notifications/src/presentation/widgets/notifications_loading_shimmer.dart';
import 'package:util/src/base_cubit/base_state.dart';
import 'package:util/util.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              NotificationsCubit(GetIt.I<NotificationsRepository>())
                ..fetchNotifications(),
      child: const _NotificationsScreenContent(),
    );
  }
}

class _NotificationsScreenContent extends StatelessWidget {
  const _NotificationsScreenContent();

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      withBackgroundGradient: true,
      body: Column(
        children: [
          const NotificationsHeaderAppBar(title: 'Notifications'),
          SizedBox(height: UI.spacing.xs),
          Divider(height: 1, thickness: 1, color: UIColor.neutral100),
          Expanded(
            child: BlocBuilder<
              NotificationsCubit,
              BaseState<List<NotificationItemModel>>
            >(
              builder: (context, state) {
                if (state.status == BaseCubitStatus.loading) {
                  return const NotificationsLoadingShimmer();
                }

                final notifications =
                    state.data ?? const <NotificationItemModel>[];
                if (notifications.isEmpty) {
                  return Center(
                    child: UIText.bodyMedium('No notifications yet'),
                  );
                }

                final sortedNotifications = _sortNotificationsByDateDesc(
                  notifications,
                );

                final grouped = DateGroupingHelper.groupByDate(
                  sortedNotifications,
                );
                final sections = _buildSections(grouped);

                return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<NotificationsCubit>().fetchNotifications(
                      refresh: true,
                    );
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: UI.padding.notificationsContent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildSectionItems(sections),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<NotificationItemModel> _sortNotificationsByDateDesc(
    List<NotificationItemModel> notifications,
  ) {
    return [...notifications]..sort((a, b) {
      final aDate = a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bDate = b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });
  }

  List<NotificationSection> _buildSections(
    GroupedByDate<NotificationItemModel> grouped,
  ) {
    final sections = <NotificationSection>[];

    if (grouped.hasToday) {
      sections.add(NotificationSection(label: 'Today', items: grouped.today));
    }
    if (grouped.hasYesterday) {
      sections.add(
        NotificationSection(label: 'Yesterday', items: grouped.yesterday),
      );
    }
    if (grouped.hasLastWeek) {
      sections.add(
        NotificationSection(label: 'Last Week', items: grouped.lastWeek),
      );
    }
    if (grouped.hasEarlier) {
      sections.add(
        NotificationSection(label: 'Earlier', items: grouped.earlier),
      );
    }

    return sections;
  }

  List<Widget> _buildSectionItems(List<NotificationSection> sections) {
    return ListWidgetBuilder.mapWithIsLast(sections, (section, _, isLastItem) {
      return NotificationSectionView(section: section, isLast: isLastItem);
    });
  }
}
