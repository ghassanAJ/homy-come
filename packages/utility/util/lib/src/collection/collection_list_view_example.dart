import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/util.dart';

/// Simple data model for the example
class SimpleItem {
  final int id;
  final String title;

  const SimpleItem({required this.id, required this.title});
}

/// A mock [BaseUseCase] that simulates loading a list of [SimpleItem].
class MockLoadItemsUseCase extends BaseUseCase<List<SimpleItem>> {
  final Duration delay;
  final bool failOnce;
  bool _failed = false;

  MockLoadItemsUseCase({
    this.delay = const Duration(milliseconds: 600),
    this.failOnce = false,
  });

  @override
  Future<Result<List<SimpleItem>, APIException>> call() async {
    return Result.fromAsync(() async {
      // Optionally simulate a one-time failure to demonstrate error handling
      if (failOnce && !_failed) {
        _failed = true;
        await Future<void>.delayed(delay);
        throw APIException.error('Simulated load failure');
      }

      await Future<void>.delayed(delay);
      return List<SimpleItem>.generate(
        12,
        (int index) => SimpleItem(id: index, title: 'Item #$index'),
      );
    });
  }
}

/// Example screen demonstrating how to use [CollectionListView] with [BaseListCubit].
class CollectionListViewExampleScreen extends StatelessWidget {
  const CollectionListViewExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaseListCubit<SimpleItem>>(
      create:
          (_) => BaseListCubit<SimpleItem>(
            loader: MockLoadItemsUseCase(failOnce: true),
          )..fetchItems(),
      child: const _ExampleBody(),
    );
  }
}

class _ExampleBody extends StatelessWidget {
  const _ExampleBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseListCubit<SimpleItem>>();
    return Scaffold(
      appBar: AppBar(title: const Text('CollectionListView Example')),
      body: CollectionListView<SimpleItem>(
        padding: const EdgeInsets.symmetric(vertical: 8),
        separator: const Divider(height: 1),
        onRefresh: (c) => c.refresh(),
        itemBuilder: (context, items, index) {
          return ListTile(
            title: Text(items[index].title),
            subtitle: Text('ID: ${items[index].id}'),
            onTap: () async {
              final newTitle = await _editTitleDialog(
                context,
                items[index].title,
              );
              if (newTitle != null && newTitle.trim().isNotEmpty) {
                cubit.updateWhere(
                  useCase: MockLoadItemsUseCase(),
                  where: (it) => it.id == items[index].id,
                  update: (it) => SimpleItem(id: it.id, title: newTitle.trim()),
                );
              }
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed:
                  () => cubit.deleteItem(
                    useCase: MockLoadItemsUseCase(),
                    removeWhere: (it) => it.id == items[index].id,
                  ),
              tooltip: 'Delete',
            ),
          );
        },
        emptyBuilder: (context) => const Center(child: Text('No items found')),
        errorBuilder: (context, message, onRetry) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: onRetry,
                    child: const Text('Try again'),
                  ),
                ],
              ),
            ),
          );
        },
        loadingBuilder:
            (context) =>
                const Center(child: MDProgressIndicator(width: 32, height: 32)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final now = DateTime.now().millisecondsSinceEpoch;
          //  cubit.addItem(MockLoadItemsUseCase());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }
}

Future<String?> _editTitleDialog(
  BuildContext context,
  String currentTitle,
) async {
  final controller = TextEditingController(text: currentTitle);
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: UIText.h1('Edit Item', textAlign: TextAlign.center),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter item title'),
          autofocus: true,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: UIText.buttonText('Cancel', textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: UIText.buttonText('Save', textAlign: TextAlign.center),
          ),
        ],
      );
    },
  );
}
