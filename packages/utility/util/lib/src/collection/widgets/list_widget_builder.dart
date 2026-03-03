import 'package:flutter/widgets.dart';

class ListWidgetBuilder {
  const ListWidgetBuilder._();

  static List<Widget> mapWithIsLast<T>(
    List<T> items,
    Widget Function(T item, int index, bool isLast) itemBuilder,
  ) {
    return List<Widget>.generate(items.length, (index) {
      final item = items[index];
      final isLast = index == items.length - 1;
      return itemBuilder(item, index, isLast);
    });
  }
}
