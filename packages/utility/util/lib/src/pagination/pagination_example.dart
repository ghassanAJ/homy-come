// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:md_design_system/md_design_system.dart';
// import 'package:util/util.dart';

// /// A simple data model used by the example below.
// class DemoItem {
//   final int id;
//   final String title;

//   const DemoItem({required this.id, required this.title});
// }

// /// Mock implementation of [BaseFetchPaginationUseCase] that simulates
// /// fetching pages of [DemoItem]s from a backend.
// class MockFetchItemsUseCase extends BaseFetchPaginationUseCase<DemoItem> {
//   /// Simulate a finite list of items living somewhere remotely.
//   static const int _totalItems = 87;

//   /// Optional delay to mimic network latency.
//   final Duration networkDelay;

//   /// If set, this page will throw an error once to demonstrate error handling.
//   final int? failOnceOnPage;

//   bool _didFail = false;

//   MockFetchItemsUseCase({
//     this.networkDelay = const Duration(milliseconds: 600),
//     this.failOnceOnPage,
//   });

//   @override
//   Future<Result<PageModel<DemoItem>, MDException>> call(
//     int page,
//     int itemsPerPage,
//   ) async {
//     return Result.fromAsync(() async {
//       // Optional simulated failure for a specific page (once).
//       if (failOnceOnPage != null && page == failOnceOnPage && !_didFail) {
//         _didFail = true;
//         throw MDException.error('Simulated error on page $page');
//       }

//       // Simulate network latency.
//       await Future<void>.delayed(networkDelay);

//       final int start = page * itemsPerPage;
//       final int endExclusive = (start + itemsPerPage).clamp(0, _totalItems);

//       if (start >= _totalItems) {
//         // No items beyond total.
//         return PageModel<DemoItem>(
//           items: const [],
//           pageNumber: page,
//           totalNoOfItems: _totalItems,
//           itemsPerPage: itemsPerPage,
//         );
//       }

//       final List<DemoItem> items = List<DemoItem>.generate(
//         endExclusive - start,
//         (int index) {
//           final int id = start + index;
//           return DemoItem(id: id, title: 'Item #$id');
//         },
//       );

//       return PageModel<DemoItem>(
//         items: items,
//         pageNumber: page,
//         totalNoOfItems: _totalItems,
//         itemsPerPage: itemsPerPage,
//       );
//     });
//   }
// }

// /// A minimal example screen showing how to use [PaginationCubit] with a
// /// [ListView], pull-to-refresh, and infinite scroll.
// class PaginationExampleScreen extends StatelessWidget {
//   const PaginationExampleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<PaginationCubit<DemoItem>>(
//       create:
//           (_) => PaginationCubit<DemoItem>(
//             usecase: MockFetchItemsUseCase(failOnceOnPage: 2),
//             initialPage: 0,
//             itemsPerPage: 5,
//           ),
//       child: const _PaginationExampleView(),
//     );
//   }
// }

// class _PaginationExampleView extends StatelessWidget {
//   const _PaginationExampleView();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Pagination Cubit Example')),
//       body: BlocBuilder<PaginationCubit<DemoItem>, PaginationState<DemoItem>>(
//         builder: (BuildContext context, PaginationState<DemoItem> state) {
//           final cubit = context.read<PaginationCubit<DemoItem>>();

//           // Initial loading & empty states.
//           if (state.paginatedList.items.isEmpty) {
//             if (state.status == PaginationStatus.error) {
//               return _ErrorView(
//                 message: state.paginationFailure?.message ?? 'Unknown error',
//                 onRetry: cubit.tryAgain,
//               );
//             }
//             if (state.status == PaginationStatus.noDataFound) {
//               return const _EmptyView();
//             }
//             if (state.status == PaginationStatus.initial) {
//               return const Center(
//                 child: MDProgressIndicator(width: 32, height: 32),
//               );
//             }
//           }

//           return SliverPaginatedListView<DemoItem>(
//             separator: const Divider(height: 1),
//             itemBuilder: (context, item, index) {
//               return ListTile(
//                 title: Text(item.title),
//                 subtitle: Text('ID: ${item.id}'),
//                 onTap: () async {
//                   final newTitle = await _showEditDialog(context, item.title);
//                   if (newTitle != null && newTitle.trim().isNotEmpty) {
//                     cubit.editItemWhere(
//                       where: (d) => d.id == item.id,
//                       update: (d) => DemoItem(id: d.id, title: newTitle.trim()),
//                     );
//                   }
//                 },
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete_outline),
//                   onPressed:
//                       () => cubit.removeItemWhereFromPage(
//                         removeWhere: (d) => d.id == item.id,
//                       ),
//                   tooltip: 'Delete',
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           final cubit = context.read<PaginationCubit<DemoItem>>();
//           final now = DateTime.now().millisecondsSinceEpoch;
//           cubit.addItemToLastPage(
//             item: DemoItem(id: now, title: 'New Item #$now'),
//           );
//         },
//         icon: const Icon(Icons.add),
//         label: const Text('Add'),
//       ),
//     );
//   }
// }

// Future<String?> _showEditDialog(
//   BuildContext context,
//   String currentTitle,
// ) async {
//   final controller = TextEditingController(text: currentTitle);
//   return showDialog<String>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Edit Item'),
//         content: TextField(
//           controller: controller,
//           decoration: const InputDecoration(hintText: 'Enter item title'),
//           autofocus: true,
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () => Navigator.of(context).pop(controller.text),
//             child: const Text('Save'),
//           ),
//         ],
//       );
//     },
//   );
// }

// // Removed local loader and load-more error rows; these are handled by PaginatedListView.

// class _ErrorView extends StatelessWidget {
//   final String message;
//   final VoidCallback onRetry;
//   const _ErrorView({required this.message, required this.onRetry});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(message, textAlign: TextAlign.center),
//             const SizedBox(height: 12),
//             ElevatedButton(onPressed: onRetry, child: const Text('Try again')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EmptyView extends StatelessWidget {
//   const _EmptyView();

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('No items found'));
//   }
// }
