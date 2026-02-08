import 'package:util/util.dart';

/// Example demonstrating how to use the DateGroupable interface and DateGroupingHelper.
///
/// This example shows two approaches:
/// 1. Implementing DateGroupable interface in your model
/// 2. Using the extractor function for models that don't implement DateGroupable

// APPROACH 1: Implement DateGroupable interface
// -----------------------------------------------
// This is the recommended approach for new models or models you can modify.

class TaskModel implements DateGroupable {
  final String id;
  final String title;
  final DateTime? createdAt;
  final DateTime? completedAt;

  TaskModel({
    required this.id,
    required this.title,
    this.createdAt,
    this.completedAt,
  });

  // Implement the required getter from DateGroupable
  // You can choose which date field to use for grouping
  @override
  DateTime? get groupingDate => createdAt;
}

class MoneyRequestModel implements DateGroupable {
  final String id;
  final double amount;
  final DateTime? requestedAt;

  MoneyRequestModel({required this.id, required this.amount, this.requestedAt});

  @override
  DateTime? get groupingDate => requestedAt;
}

// APPROACH 2: Use extractor function
// -----------------------------------------------
// Use this approach when:
// - You can't modify the model class
// - You want to group by a different date field dynamically
// - You're working with third-party models

class ExternalModel {
  final String id;
  final DateTime? timestamp;

  ExternalModel(this.id, this.timestamp);
}

void exampleUsage() {
  // Create sample data
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

  // APPROACH 1: Using DateGroupable (Recommended)
  final groupedTasks = DateGroupingHelper.groupByDate(tasks);

  // Access grouped items using convenient getters
  final todayTasks = groupedTasks.today;
  final yesterdayTasks = groupedTasks.yesterday;
  final lastWeekTasks = groupedTasks.lastWeek;
  final earlierTasks = groupedTasks.earlier;

  print('Today: ${todayTasks.length} tasks');
  print('Yesterday: ${yesterdayTasks.length} tasks');
  print('Last Week: ${lastWeekTasks.length} tasks');
  print('Earlier: ${earlierTasks.length} tasks');

  // APPROACH 2: Using extractor function
  final externalItems = [
    ExternalModel('1', DateTime.now()),
    ExternalModel('2', DateTime.now().subtract(Duration(days: 3))),
  ];

  final groupedExternal = DateGroupingHelper.groupByDateWithExtractor(
    externalItems,
    (item) => item.timestamp, // Extract the date field
  );
  print('External items grouped: ${groupedExternal.today.length}');

  // You can also use the extractor to group by a different field
  final groupedByCompletedDate = DateGroupingHelper.groupByDateWithExtractor(
    tasks,
    (task) => task.completedAt, // Group by completedAt instead of createdAt
  );
  print('Completed today: ${groupedByCompletedDate.today.length}');

  // Get human-readable labels
  final labels = DateFilter.values.map(
    (filter) => DateGroupingHelper.getFilterLabel(filter),
  );
  print('Available filters: ${labels.join(", ")}');
}

// BONUS: Using with BLoC/Cubit
// -----------------------------------------------

class TaskState {
  final GroupedByDate<TaskModel> groupedTasks;

  TaskState({required this.groupedTasks});

  // Get tasks for a specific filter
  List<TaskModel> getTasksForFilter(DateFilter filter) {
    return groupedTasks.getItemsFor(filter);
  }

  // Check if a filter has tasks
  bool hasTasksForFilter(DateFilter filter) {
    return groupedTasks.hasItemsFor(filter);
  }

  // Get all non-empty filters
  List<DateFilter> getNonEmptyFilters() {
    return groupedTasks.nonEmptyCategories;
  }

  // Get total count
  int get totalTaskCount => groupedTasks.totalCount;
}

class TaskCubit {
  void loadTasks(List<TaskModel> tasks) {
    final grouped = DateGroupingHelper.groupByDate(tasks);
    // ignore: unused_local_variable
    final state = TaskState(groupedTasks: grouped);
    // emit(state); // In real cubit
  }
}

// BONUS: Extension methods for convenience
// -----------------------------------------------

extension TaskListExtensions on List<TaskModel> {
  /// Convenience method to group tasks by date
  GroupedByDate<TaskModel> groupByDate() {
    return DateGroupingHelper.groupByDate(this);
  }
}

void extensionExample() {
  final tasks = <TaskModel>[
    TaskModel(id: '1', title: 'Task 1', createdAt: DateTime.now()),
  ];

  // Use the extension method
  final grouped = tasks.groupByDate();
  print('Tasks grouped: ${grouped.today.length}');
}
