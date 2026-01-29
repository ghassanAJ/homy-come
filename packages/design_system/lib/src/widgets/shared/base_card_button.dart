// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ui/ui.dart';

// abstract class BaseCardButton extends StatelessWidget {
//   const BaseCardButton({super.key, this.isFilled = false, required this.label});

//   final bool isFilled;
//   final String label;
//   Widget buildButton(BuildContext context);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 44,
//       decoration: BoxDecoration(
//         color: isFilled ? MDTheme.styles.p1Color : Colors.white,

//         border: Border.all(color: Color(0xffE2E0E9)),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: buildButton(context),
//     );
//   }
// }

// abstract class BaseTaskCardButtonWithText extends BaseCardButton {
//   const BaseTaskCardButtonWithText({
//     super.key,
//     required super.label,
//     super.isFilled,
//   });

//   @override
//   Widget buildButton(BuildContext context) {
//     return Center(
//       child: MdText(
//         label,
//         type: MdTextType.body2,
//         color: isFilled ? Colors.white : MDTheme.styles.p3Color,
//         style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//       ),
//     );
//   }
// }

// abstract class BaseCardButtonWithUseCase extends BaseCardButton {
//   const BaseCardButtonWithUseCase({
//     super.key,
//     required super.label,
//     super.isFilled,
//     this.validate,
//     this.onSuccess,
//     this.onError,
//   });

//   BaseUseCase<void> get usecase;
//   final Future<bool> Function(BuildContext context)? validate;
//   final Future<void> Function(BuildContext context)? onSuccess;
//   final Future<void> Function(BuildContext context, MDException error)? onError;
//   @override
//   Widget buildButton(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BaseButtonCubit<void>(),
//       child: Builder(
//         builder: (context) {
//           return ButtonCubitBuilder<void>(
//             onSuccess: (context, state) {
//               if (onSuccess != null) {
//                 onSuccess!(context);
//               }
//             },
//             loadingWidget:
//                 () => Center(
//                   child: SizedBox(
//                     width: 16,
//                     height: 16,
//                     child: CircularProgressIndicator.adaptive(
//                       strokeWidth: 1,
//                       backgroundColor:
//                           super.isFilled ? Colors.white : UIColor.primary,
//                     ),
//                   ),
//                 ),
//             onError: onError,
//             builder:
//                 (_, state) =>
//                     state.status == BaseCubitStatus.success
//                         ? SizedBox.shrink()
//                         : SizedBox(
//                           height: 36,
//                           width: double.infinity, // ✅ Expand tap area
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color:
//                                   isFilled
//                                       ? MDTheme.styles.p1Color
//                                       : Colors.white,
//                               border: Border.all(
//                                 color:
//                                     isFilled
//                                         ? Colors.transparent
//                                         : UIColor.neutral200,
//                                 width: .5,
//                               ),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: TextButton(
//                               style: TextButton.styleFrom(
//                                 foregroundColor:
//                                     isFilled
//                                         ? Colors.white
//                                         : MDTheme.styles.p3Color,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               onPressed: () async {
//                                 if (validate != null &&
//                                     !(await validate!(context))) {
//                                   return;
//                                 }
//                                 if (!context.mounted) return;
//                                 context.read<BaseButtonCubit<void>>().execute(
//                                   useCase: usecase,
//                                 );
//                               },
//                               child:
//                                   state.isLoading
//                                       ? const Center(
//                                         child: SizedBox(
//                                           width: 16,
//                                           height: 16,
//                                           child:
//                                               CircularProgressIndicator.adaptive(
//                                                 strokeWidth: 1,
//                                               ),
//                                         ),
//                                       )
//                                       : UIText.bodyMedium(
//                                         label,
//                                         color:
//                                             isFilled
//                                                 ? UIColor.white
//                                                 : UIColor.primaryDark,
//                                       ),
//                             ),
//                           ),
//                         ),
//           );
//         },
//       ),
//     );
//   }
// }
