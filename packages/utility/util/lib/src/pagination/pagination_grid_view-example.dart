// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:util/util.dart';

// class PaginationGridExampleScreen extends StatelessWidget {
//   const PaginationGridExampleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<PaginationCubit<DemoItem>>(
//       create:
//           (_) => PaginationCubit<DemoItem>(
//             usecase: MockFetchItemsUseCase(failOnceOnPage: 2),
//             initialPage: 0,
//             itemsPerPage: 6,
//           ),
//       child: const _GridViewBody(),
//     );
//   }
// }

// class _GridViewBody extends StatelessWidget {
//   const _GridViewBody();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<PaginationCubit<DemoItem>>();
//     return Scaffold(
//       appBar: AppBar(title: const Text('Pagination Grid Example')),
//       body: PaginatedGridView<DemoItem>(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 1,
//         ),
//         itemBuilder: (context, item, index) {
//           return InkWell(
//             onTap: () async {
//               final newTitle = await _editTitleDialog(context, item.title);
//               if (newTitle != null && newTitle.trim().isNotEmpty) {
//                 cubit.editItemWhere(
//                   where: (d) => d.id == item.id,
//                   update: (d) => DemoItem(id: d.id, title: newTitle.trim()),
//                 );
//               }
//             },
//             onLongPress: () {
//               cubit.removeItemWhereFromPage(
//                 removeWhere: (d) => d.id == item.id,
//               );
//             },
//             child: Card(
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(item.title, textAlign: TextAlign.center),
//                       const SizedBox(height: 6),
//                       Text(
//                         'ID: ${item.id}',
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         icon: const Icon(Icons.add),
//         label: const Text('Add'),
//         onPressed: () {
//           final now = DateTime.now().millisecondsSinceEpoch;
//           cubit.addItemToLastPage(
//             item: DemoItem(id: now, title: 'New Item #$now'),
//           );
//         },
//       ),
//     );
//   }
// }

// Future<String?> _editTitleDialog(
//   BuildContext context,
//   String currentTitle,
// ) async {
//   final controller = TextEditingController(text: currentTitle);
//   return showDialog<String>(
//     context: context,
//     builder:
//         (_) => AlertDialog(
//           title: const Text('Edit Item'),
//           content: TextField(
//             controller: controller,
//             decoration: const InputDecoration(hintText: 'Enter new title'),
//             autofocus: true,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context, controller.text),
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//   );
// }
