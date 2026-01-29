import 'package:flutter/material.dart';
import 'package:util/src/pagination/pagination_constants.dart';

typedef ErrorBuilder =
    Widget Function(BuildContext context, String message, VoidCallback onRetry);

typedef SimpleBuilder = Widget Function(BuildContext context);

class BaseStateView extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final bool isEmpty;
  final String? errorMessage;
  final String? emptyMessage;
  final VoidCallback? onRetry;
  final SimpleBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final SimpleBuilder? emptyBuilder;
  final Widget child;

  const BaseStateView({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.isEmpty,
    required this.child,
    this.errorMessage,
    this.emptyMessage,
    this.onRetry,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      final loader =
          loadingBuilder ??
          (ctx) => const Center(child: CircularProgressIndicator());
      return loader(context);
    }

    if (hasError) {
      if (onRetry == null) {
        return Center(
          child: Text(
            errorMessage ?? PaginationConstants.defaultUnknownErrorMessage,
          ),
        );
      }
      final builder =
          errorBuilder ??
          (ctx, msg, retry) => _DefaultErrorView(message: msg, onRetry: retry);
      return builder(
        context,
        errorMessage ?? PaginationConstants.defaultUnknownErrorMessage,
        onRetry ?? () {},
      );
    }

    if (isEmpty) {
      final builder =
          emptyBuilder ??
          (ctx) => _DefaultEmptyView(
            message: emptyMessage ?? PaginationConstants.defaultEmptyMessage,
          );
      return builder(context);
    }

    return child;
  }
}

class _DefaultErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _DefaultErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
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
              child: Text(PaginationConstants.defaultTryAgainLabel),
            ),
          ],
        ),
      ),
    );
  }
}

class _DefaultEmptyView extends StatelessWidget {
  final String message;
  const _DefaultEmptyView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
