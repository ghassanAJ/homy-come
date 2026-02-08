/// JSON key constants for PageModel serialization.
class _PageModelKeys {
  static const String pageNumber = 'page';
  static const String itemsPerPage = 'limit';
  static const String totalPages = 'total_pages';
  static const String hasNext = 'has_next';
  static const String hasPrevious = 'has_prev';
  static const String total = 'total';
}

class PageModel<T> {
  /// List of items on the current page.
  final List<T> items;

  /// The current page number.
  final int? pageNumber;

  /// The total number of items available across all pages.
  final int? totalNoOfItems;

  /// The number of items per page.
  final int? itemsPerPage;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrevious;

  /// Constructor to create a [PageModel] instance with the given list of items and optional pagination details.
  PageModel({
    required this.items,
    required this.pageNumber,
    required this.totalNoOfItems,
    required this.itemsPerPage,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
  });

  /// A factory constructor that creates an empty [PageModel] instance with no items.
  factory PageModel.empty() {
    return PageModel(
      items: [],
      totalNoOfItems: 0,
      itemsPerPage: 0,
      totalPages: 0,
      hasNext: false,
      hasPrevious: false,
      pageNumber: 0,
    );
  }

  /// A factory constructor that creates a [PageModel] instance from JSON data.
  ///
  /// [json] - The JSON data representing the page response.
  /// [listDecode] - A function to decode each item in the `items` list.
  factory PageModel.fromJson(
    Map json,
    T Function(Map json) listDecode, {
    String? key,
  }) {
    return PageModel(
      items:
          json[key ?? 'items'] != null
              ? (json[key ?? 'items'] as List)
                  .map<T>((e) => listDecode.call(e))
                  .toList()
              : [],
      pageNumber: json[_PageModelKeys.pageNumber] ?? 0,
      totalNoOfItems: json[_PageModelKeys.total] ?? 0,
      itemsPerPage: json[_PageModelKeys.itemsPerPage] ?? 0,
      totalPages: json[_PageModelKeys.totalPages] ?? 0,
      hasNext: json[_PageModelKeys.hasNext] ?? false,
      hasPrevious: json[_PageModelKeys.hasPrevious] ?? false,
    );
  }

  @override
  String toString() {
    return 'data: ${items.map((e) => '${e.toString()}\n')}';
  }
}
