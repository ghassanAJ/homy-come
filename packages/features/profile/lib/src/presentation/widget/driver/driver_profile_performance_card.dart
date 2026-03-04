import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';
import 'package:profile/src/data/model/res/driver_performance_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/localization/profile_localization_scope.dart';
import 'package:profile/src/presentation/cubit/profile_cubit.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_background_circle_painter.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_performance_legend_item.dart';
import 'package:util/util.dart'
    show BaseCubitStatus, BaseState, DonutChartPainter, DonutSegment;

class PerformanceCard extends StatefulWidget {
  const PerformanceCard({super.key, this.performanceRepository});

  final ProfileRepository? performanceRepository;

  @override
  State<PerformanceCard> createState() => _PerformanceCardState();
}

class _PerformanceCardState extends State<PerformanceCard> {
  late final ProfileRepository _repository =
      widget.performanceRepository ?? GetIt.I<ProfileRepository>();
  late final ProfileCubit _cubit =
      ProfileCubit(_repository)..fetchDriverPerformance();

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<ProfileCubit, BaseState<DriverPerformanceModel>>(
        builder: (context, state) {
          final performance = state.data ?? DriverPerformanceModel.empty;
          final metrics = performance.metrics;
          final donutSegments = metrics
              .map(
                (metric) => DonutSegment(
                  color: _metricColor(metric.type),
                  ratio: metric.donutRatio,
                ),
              )
              .toList(growable: false);

          final isInitialLoading =
              state.status == BaseCubitStatus.initial ||
              state.status == BaseCubitStatus.loading;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: UIColor.background,
              borderRadius: BorderRadius.circular(UI.radius.md),
              boxShadow: UI.shadows.cardMd,
            ),
            child: Padding(
              padding: UI.padding.driverProfilePerformanceCardContent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.bodyMedium(
                    context.profileTranslation.driverProfile.trackPerformance,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: UI.spacing.lg),
                  if (isInitialLoading && metrics.isEmpty)
                    SizedBox(
                      width: 210,
                      height: 210,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  else
                    _buildPerformanceDonutChart(
                      ordersCount: performance.ordersCount,
                      ordersLabel: context.profileTranslation.driverProfile.orders,
                      donutSegments: donutSegments,
                    ),
                  SizedBox(height: UI.spacing.lg),
                  if (metrics.isNotEmpty)
                    Padding(
                      padding: UI.padding.driverProfilePerformanceLegendHorizontal,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final spacing = UI.spacing.md;
                          final itemWidth = (constraints.maxWidth - spacing) / 2;

                          return Wrap(
                            spacing: spacing,
                            runSpacing: UI.spacing.md,
                            children:
                                metrics
                                    .map(
                                      (metric) => SizedBox(
                                        width: itemWidth,
                                        child: PerformanceLegendItem(
                                          label: _metricLabel(context, metric),
                                          color: _metricColor(metric.type),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _metricLabel(
    BuildContext context,
    DriverPerformanceMetricModel metric,
  ) {
    final title = switch (metric.type) {
      DriverPerformanceMetricType.completed =>
        context.profileTranslation.driverProfile.completed,
      DriverPerformanceMetricType.canceledOrder =>
        context.profileTranslation.driverProfile.canceledOrder,
      DriverPerformanceMetricType.punctuality =>
        context.profileTranslation.driverProfile.punctuality,
      DriverPerformanceMetricType.customerSatisfaction =>
        context.profileTranslation.driverProfile.customerSatisfaction,
    };

    return '$title ${metric.percentage}%';
  }

  Color _metricColor(DriverPerformanceMetricType type) {
    return switch (type) {
      DriverPerformanceMetricType.completed => UIColor.softGreen,
      DriverPerformanceMetricType.canceledOrder => UIColor.errorLight,
      DriverPerformanceMetricType.punctuality => UIColor.softYellow,
      DriverPerformanceMetricType.customerSatisfaction => UIColor.babyBlue,
    };
  }

  Widget _buildPerformanceDonutChart({
    required int ordersCount,
    required String ordersLabel,
    required List<DonutSegment> donutSegments,
  }) {
    return Center(
      child: SizedBox(
        width: 210,
        height: 210,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size.square(210),
              painter: DriverProfileBackgroundCirclePainter(
                color: UIColor.softBlue,
                strokeWidth: 30,
              ),
            ),
            CustomPaint(
              size: const Size.square(200),
              painter: DonutChartPainter(
                segments: donutSegments,
                strokeWidth: 18,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.bodyMedium(
                  '$ordersCount',
                  fontSize: 52,
                  fontWeight: FontWeight.w500,
                  color: UIColor.neutral900,
                  fontFamily: UIFontFamily.sFPro,
                ),
                SizedBox(height: UI.spacing.xxs),
                UIText.bodySmall(
                  ordersLabel,
                  color: UIColor.neutral400,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
