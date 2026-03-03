import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:design_system/design_system.dart';

class HeaderInfoSection extends StatelessWidget {
  const HeaderInfoSection({
    super.key,
    required this.data,
    required this.context,
  });

  final PageData data;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/transparent.png',
                image: data.backgroundUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(color: UIColor.black.withOpacity(0.5)),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              UIText.caption(
                'Step 1 to 4',
                color: UIColor.textSecondary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4.0),
              UIText.h2(data.title, textAlign: TextAlign.center),
              const SizedBox(height: 8.0),

              // Center(
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 16.0,
              //       vertical: 4.0,
              //     ),
              //     decoration: BoxDecoration(
              //       border: Border.all(color: scheme.surface),
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //     child: Text(
              //       "duration: ${data.deliverTime}",
              //       style: textTheme.bodySmall?.copyWith(color: scheme.surface),
              //       strutStyle: StrutStyle(forceStrutHeight: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star_rate_rounded, size: 16, color: Colors.yellow),
                  const SizedBox(width: 4.0),
                  UIText.bodySmall(data.rate.toString()),
                  const SizedBox(width: 4.0),
                  UIText.bodySmall("(${data.rateQuantity} )"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
