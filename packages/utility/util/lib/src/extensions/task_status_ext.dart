// import 'package:task/task.dart';

// extension TaskStatusExtension on TaskStatus {
//   String get actionLabel {
//     switch (this) {
//       case TaskStatus.PENDING_APPROVAL:
//         return 'Approve';
//       case TaskStatus.REJECTED:
//         return 'Reject';
//       case TaskStatus.APPROVED:
//         return 'Approve';
//       case TaskStatus.ONGOING:
//         return 'Send for approval';
//       case TaskStatus.CANCELLED:
//         return 'Cancelled';
//       case TaskStatus.SOFT_DELETE:
//         return 'Delete';
//       case TaskStatus.PAYOUT_FAILED:
//         return 'Payout Failed';
//       case TaskStatus.PAYOUT_INITIATED:
//         return 'Payout Initiated';
//       case TaskStatus.PAYOUT_SUCCESS:
//         return 'Payout Success';
//       case TaskStatus.ARCHIVED:
//         return 'Archive';
//     }
//   }

//   Widget labelWidget() {
//     switch (this) {
//       case TaskStatus.APPROVED:
//         return TaskStatusLabel(
//           label: 'Approved',
//           icon: Assets.icons.tickCircle,
//           color: MDTheme.styles.successColor,
//         );
//       case TaskStatus.PENDING_APPROVAL:
//         return TaskStatusLabel(
//           label: 'Being rewied',
//           icon: Assets.icons.pening,
//           color: MDTheme.styles.warningColor,
//         );
//       case TaskStatus.REJECTED:
//         return TaskStatusLabel(
//           label: 'Rejected',
//           icon: Assets.icons.closeCircle,
//           color: MDTheme.styles.errorColor,
//         );
//       case TaskStatus.ONGOING:
//         return SizedBox();
//       case TaskStatus.CANCELLED:
//         return SizedBox();
//       case TaskStatus.ARCHIVED:
//         return SizedBox();
//       case TaskStatus.SOFT_DELETE:
//         return SizedBox();
//       case TaskStatus.PAYOUT_FAILED:
//         return SizedBox();
//       case TaskStatus.PAYOUT_INITIATED:
//         return SizedBox();
//       case TaskStatus.PAYOUT_SUCCESS:
//         return SizedBox();
//     }
//   }
// }
