import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/home_offers_list.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

class SlidersSection extends StatelessWidget {
  const SlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();

    return BlocBuilder<HomeBloc, HomeBlocState>(
      buildWhen: (previous, current) => previous.sliders != current.sliders,
      builder:
          (context, state) => HomeSection(
            title: tr.home.offersNews,
            sectionBottomSpacing: UI.spacing.lg,
            child: SizedBox(
              height: 145,
              child: HomeOffersList(items: state.sliders),
            ),
          ),
    );
  }
}
