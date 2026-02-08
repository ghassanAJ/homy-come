import '../../../design_system.dart';

class KeepWidgetAlive extends StatefulWidget {
  final Widget child;

  const KeepWidgetAlive({super.key, required this.child});

  @override
  State<KeepWidgetAlive> createState() => _KeepWidgetAliveState();
}

class _KeepWidgetAliveState extends State<KeepWidgetAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(
      context,
    ); // must call super.build when using AutomaticKeepAliveClientMixin
    return widget.child;
  }
}
