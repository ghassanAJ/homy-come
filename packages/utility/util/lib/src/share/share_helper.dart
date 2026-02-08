// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

class ShareArgs {
  final String text;
  final Rect? sharePositionOrigin;
  final String? subject;
  final String? title;
  ShareArgs({
    required this.text,
    this.sharePositionOrigin,
    this.subject,
    this.title,
  });
}

abstract class ShareHelper {
  Future<void> shareText(ShareArgs args);
}

@Injectable(as: ShareHelper)
class ShareHelperImpl implements ShareHelper {
  @override
  Future<void> shareText(ShareArgs args) async {
    try {
      // Try the primary SharePlus API (adjust if your package uses a different API)
      await SharePlus.instance.share(
        ShareParams(
          subject: args.subject?.isEmpty ?? true ? null : args.subject,
          text: args.text,
          title: args.title,
          sharePositionOrigin: args.sharePositionOrigin,
        ),
      );
    } catch (err, st) {
      // Log for debugging
      debugPrint('Share failed: $err\n$st');

      // Fallback: try share_plus package simple API if available
      try {
        await Share.share(
          args.text,
          // subject: args.subject?.isEmpty ?? true ? null : args.subject,
          //  sharePositionOrigin: args.sharePositionOrigin,
        );
        return;
      } catch (err2, st2) {
        debugPrint('Fallback share failed: $err2\n$st2');
      }
    }
  }
}
