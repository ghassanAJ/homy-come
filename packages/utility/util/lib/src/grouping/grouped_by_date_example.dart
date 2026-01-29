import 'package:util/util.dart';

/// Examples demonstrating how to use the GroupedByDate model.

class TaskModel implements DateGroupable {
  final String id;
  final String title;
  final DateTime? createdAt;

  TaskModel({required this.id, required this.title, this.createdAt});

  @override
  DateTime? get groupingDate => createdAt;
}

void basicUsageExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
    TaskModel(
      id: '2',
      title: 'Task 2',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    TaskModel(
      id: '3',
      title: 'Task 3',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
    ),
    TaskModel(
      id: '4',
      title: 'Task 4',
      createdAt: DateTime.now().subtract(Duration(days: 10)),
    ),
  ];

  // Group the tasks
  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Access items directly with convenient getters
  final todayTasks = grouped.today;
  final yesterdayTasks = grouped.yesterday;
  final lastWeekTasks = grouped.lastWeek;
  final earlierTasks = grouped.earlier;

  print('Today: ${todayTasks.length}');
  print('Yesterday: ${yesterdayTasks.length}');
  print('Last Week: ${lastWeekTasks.length}');
  print('Earlier: ${earlierTasks.length}');

  // Check if categories have items
  if (grouped.hasToday) {
    print('There are tasks from today!');
  }

  if (grouped.hasYesterday) {
    print('There are tasks from yesterday!');
  }

  // Get total count
  print('Total tasks: ${grouped.totalCount}');

  // Check if empty
  if (grouped.isNotEmpty) {
    print('We have tasks to display');
  }
}

void advancedAccessExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
    TaskModel(
      id: '2',
      title: 'Task 2',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Get items for a specific filter
  final todayTasks = grouped.getItemsFor(DateFilter.today);
  print('Today tasks: ${todayTasks.length}');

  // Check if a filter has items
  if (grouped.hasItemsFor(DateFilter.today)) {
    print('Has today tasks');
  }

  // Get count for a filter
  final todayCount = grouped.getCountFor(DateFilter.today);
  print('Today count: $todayCount');

  // Get all non-empty categories
  final nonEmpty = grouped.nonEmptyCategories;
  print('Non-empty categories: ${nonEmpty.map((f) => f.name).join(", ")}');

  // Get all items as a flat list
  final allTasks = grouped.allItems;
  print('All tasks: ${allTasks.length}');
}

void iterationExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
    TaskModel(
      id: '2',
      title: 'Task 2',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Iterate over all categories
  grouped.forEach((filter, items) {
    print('${DateGroupingHelper.getFilterLabel(filter)}: ${items.length} tasks');
  });

  // Map to new values
  final counts = grouped.map((filter, items) => {
        'filter': filter.name,
        'count': items.length,
      });
  print('Counts: $counts');

  // Convert to map if needed
  final asMap = grouped.toMap();
  final todayFromMap = asMap[DateFilter.today];
  print('Today from map: ${todayFromMap?.length}');
}

void uiExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
    TaskModel(
      id: '2',
      title: 'Task 2',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    TaskModel(
      id: '3',
      title: 'Task 3',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Build UI sections only for non-empty categories
  for (final filter in grouped.nonEmptyCategories) {
    final label = DateGroupingHelper.getFilterLabel(filter);
    final items = grouped.getItemsFor(filter);
    print('=== $label (${items.length}) ===');
    for (final task in items) {
      print('  - ${task.title}');
    }
  }
}

void blocExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
  ];

  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Example of using in a state class
  print('Has any tasks: ${grouped.isNotEmpty}');
  print('Today tasks: ${grouped.today.length}');
  print('Total: ${grouped.totalCount}');
}

void copyWithExample() {
  final tasks = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
  ];

  final grouped = DateGroupingHelper.groupByDate(tasks);

  // Add a new task to today's list
  final newTask = TaskModel(id: '2', title: 'Task 2', createdAt: DateTime.now());
  final updatedGrouped = grouped.copyWith(
    today: [...grouped.today, newTask],
  );

  print('Original today count: ${grouped.today.length}');
  print('Updated today count: ${updatedGrouped.today.length}');
}

void comparisonExample() {
  final tasks1 = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
  ];
  final tasks2 = [
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
  ];

  final grouped1 = DateGroupingHelper.groupByDate(tasks1);
  final grouped2 = DateGroupingHelper.groupByDate(tasks2);

  // Compare grouped results
  print('Are they equal? ${grouped1 == grouped2}');

  // toString for debugging
  print('Grouped1: $grouped1');
  print('Grouped2: $grouped2');
}

void extractorFunctionExample() {
  // For models that don't implement DateGroupable
  final requests = [
    _MoneyRequest('1', DateTime.now().toIso8601String()),
    _MoneyRequest('2', DateTime.now().subtract(Duration(days: 1)).toIso8601String()),
  ];

  // Use the extractor function
  final grouped = DateGroupingHelper.groupByDateWithExtractor(
    requests,
    (request) => DateTime.tryParse(request.createdAt),
  );

  print('Today requests: ${grouped.today.length}');
  print('Yesterday requests: ${grouped.yesterday.length}');
  print('Total: ${grouped.totalCount}');
}

// Helper class for the example
class _MoneyRequest {
  final String id;
  final String createdAt;

  _MoneyRequest(this.id, this.createdAt);
}

