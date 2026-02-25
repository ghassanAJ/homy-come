import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;
import 'package:go_router/go_router.dart';
import 'package:util/src/base_cubit/base_list_cubit.dart';
import 'package:util/src/base_cubit/base_state.dart';
import 'package:util/util.dart';

/// A reusable button widget connected to a `BaseCubit<T>`
/// that automatically handles loading, success, error, and empty states.
class ButtonCubitBuilder<T> extends StatelessWidget {
  /// Creates a BaseCubitBuilder.
  ///
  /// [builder] is required and represents the default button widget to display
  /// when the Cubit is idle.
  const ButtonCubitBuilder({
    super.key,
    required this.builder,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.onSuccess,
    this.onError,
    this.successMessage,
    this.errorMessage,
    this.listenWhen,
    this.buildWhen,
    this.enableDialogLoading = false,
    this.enableLoading = true,
  });
  final bool enableLoading;

  /// The main child widget (e.g., a button) shown in idle/default state.
  final Widget Function(BuildContext context, BaseState<T> state) builder;

  /// Optional widget to display while the Cubit is loading.
  final Widget Function()? loadingWidget;

  /// Optional widget to display when the Cubit returns an empty list.
  final Widget Function()? emptyWidget;

  /// Optional widget to display when the Cubit emits an error.
  final Widget Function(APIException error)? errorWidget;

  /// Optional callback triggered when the Cubit status is success.
  final Function(BuildContext context, BaseState<T> state)? onSuccess;

  /// Optional callback triggered when the Cubit status is error.
  final Function(BuildContext context, APIException error)? onError;

  /// Optional filter to control when the listener runs.
  final bool Function(BaseState<T>, BaseState<T>)? listenWhen;

  /// Optional filter to control when the builder runs.
  final bool Function(BaseState<T>, BaseState<T>)? buildWhen;

  /// The Cubit to listen to.
  final bool enableDialogLoading;

  /// Optional success message shown via toast if `onSuccess` is null.
  final String? successMessage;

  /// Optional error message shown via toast if `onError` is null.
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BaseCubit<T>, BaseState<T>>(
      buildWhen: buildWhen, // Optional rebuild control
      listenWhen: listenWhen, // Optional listener control
      builder: _builder, // Build UI based on Cubit state
      listener: (context, state) {
        // Call optional success callback

        // Handle success state
        if (state.status == BaseCubitStatus.success) {
          if (enableDialogLoading) {
            hideLoading(context);
          }
          // Show toast if message is provided and onSuccess is not defined
          if (successMessage != null && onSuccess == null) {
            ToastificationUtil.success(successMessage);
          }

          onSuccess?.call(context, state);
        }

        if (state.status == BaseCubitStatus.loading) {
          if (enableDialogLoading) {
            DialogsManager.showLoading(context);
          }
        }

        // Handle error state
        if (state.status == BaseCubitStatus.error) {
          // Show toast if onError callback is not defined
          if (onError == null) {
            ToastificationUtil.error(
              errorMessage ?? (state.error as APIException).message,
            );
            if (enableDialogLoading) {
              hideLoading(context);
            }
          } else {
            onError?.call(context, state.error as APIException);
          }

          // Call optional error callback
        }
      },
    );
  }

  /// Internal builder method to render the correct widget based on state.
  Widget _builder(context, state) {
    // Display loading widget if Cubit is loading
    if (state.status == BaseCubitStatus.loading && enableLoading) {
      return loadingWidget?.call() ?? const MDProgressIndicator(styled: true);
    }
    // Display empty widget if Cubit returned an empty list

    // Default: show the main child widget
    return builder(context, state);
  }

  void hideLoading(BuildContext context) {
    GoRouter.of(context).pop();
  }
}

class ListCubitBuilder<T> extends StatelessWidget {
  /// Creates a BaseCubitBuilder.
  ///
  /// [builder] is required and represents the default button widget to display
  /// when the Cubit is idle.
  const ListCubitBuilder({
    super.key,
    required this.builder,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.onSuccess,
    this.onError,
    this.successMessage,
    this.errorMessage,
    this.listenWhen,
    this.buildWhen,
    this.listener,
  });

  /// The main child widget (e.g., a button) shown in idle/default state.
  final Widget Function(BuildContext context, BaseState<List<T>> state) builder;

  /// Optional widget to display while the Cubit is loading.
  final Widget Function()? loadingWidget;

  /// Optional widget to display when the Cubit returns an empty list.
  final Widget Function()? emptyWidget;

  /// Optional widget to display when the Cubit emits an error.
  final Widget Function(APIException error)? errorWidget;

  /// Optional callback triggered when the Cubit status is success.
  final Function(BuildContext context, BaseState<List<T>> state)? onSuccess;

  /// Optional callback triggered when the Cubit status is error.
  final Function(BuildContext context, APIException error)? onError;

  /// Optional filter to control when the listener runs.
  final bool Function(BaseState<List<T>> state, BaseState<List<T>>)? listenWhen;

  /// Optional filter to control when the builder runs.
  final bool Function(BaseState<List<T>> state, BaseState<List<T>>)? buildWhen;
  final void Function(BuildContext, BaseState<List<T>>)? listener;

  /// The Cubit to listen to.

  /// Optional success message shown via toast if `onSuccess` is null.
  final String? successMessage;

  /// Optional error message shown via toast if `onError` is null.
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BaseListCubit<T>, BaseState<List<T>>>(
      buildWhen:
          (previous, current) =>
              buildWhen?.call(previous, current) ??
              true, // Optional rebuild control
      listenWhen:
          (previous, current) =>
              listenWhen?.call(previous, current) ??
              true, // Optional listener control
      builder: _builder, // Build UI based on Cubit state

      listener:
          listener ??
          (context, state) {
            if (state.status == BaseCubitStatus.success) {
              // Show toast if message is provided and onSuccess is not defined
              if (successMessage != null && onSuccess == null) {
                ToastificationUtil.success(successMessage);
              }
              // Call optional success callback
              onSuccess?.call(context, state);
            }
            // Handle error state
            if (state.status == BaseCubitStatus.error) {
              // Show toast if onError callback is not defined
              if (onError == null) {
                ToastificationUtil.error(
                  errorMessage ?? (state.error as APIException).message,
                );
              }
              // Call optional error callback
              onError?.call(context, state.error as APIException);
            }
          },
    );
  }

  /// Internal builder method to render the correct widget based on state.
  Widget _builder(context, state) {
    // Display loading widget if Cubit is loading
    if (state.status == BaseCubitStatus.loading) {
      return loadingWidget?.call() ??
          const MDProgressIndicator(width: 32, height: 32);
    }
    // Display empty widget if Cubit returned an empty list
    else if (state.status == BaseCubitStatus.success && state.isEmptyList()) {
      return emptyWidget?.call() ?? const SizedBox.shrink();
    }
    // Display error widget if Cubit emitted an error
    else if (state.status == BaseCubitStatus.error) {
      return errorWidget?.call(state.error as APIException) ??
          Text('Error: ${state.error}');
    }

    // Default: show the main child widget
    return builder(context, state);
  }
}
