import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notifications/src/data/model/res/notification_item_model.dart';
import 'package:notifications/src/domain/repository/notifications_repository.dart';
import 'package:notifications/src/presentation/cubit/notifications_cubit.dart';
import 'package:notifications/src/presentation/cubit/notifications_state.dart';
import 'package:notifications/src/presentation/widgets/notification_section.dart';
import 'package:notifications/src/presentation/widgets/notifications_header_app_bar.dart';
import 'package:util/util.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
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
    return Scaffold(
      backgroundColor: UIColor.background,
      body: UIEllipseBackground(
        child: Column(
          children: [
            const NotificationsHeaderAppBar(title: 'Notifications'),
            SizedBox(height: UI.spacing.xs),
            Divider(height: 1, thickness: 1, color: UIColor.neutral100),
            Expanded(
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return _buildErrorWidget(context, state.error);
                  }

                  final notifications = state.notifications;
                  if (notifications.isEmpty) {
                    return Center(
                      child: UIText.bodyMedium('No notifications yet'),
                    );
                  }

                  final sortedNotifications = [...notifications]
                    ..sort((a, b) {
                      final aDate =
                          a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
                      final bDate =
                          b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
                      return bDate.compareTo(aDate);
                    });

                  final grouped = DateGroupingHelper.groupByDate(
                    sortedNotifications,
                  );
                  final sections = _buildSections(grouped);

                  return RefreshIndicator(
                    onRefresh: () async {
                      await context
                          .read<NotificationsCubit>()
                          .fetchNotifications();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: UI.padding.notificationsContent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < sections.length; i++)
                            NotificationSectionView(
                              section: sections[i],
                              isLast: i == sections.length - 1,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, APIException? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIText.bodyMedium(error?.message ?? 'Something went wrong'),
          SizedBox(height: UI.spacing.md),
          UIButton.primary(
            onPressed: () {
              context.read<NotificationsCubit>().fetchNotifications();
            },
            label: 'Retry',
          ),
        ],
      ),
    );
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
}
