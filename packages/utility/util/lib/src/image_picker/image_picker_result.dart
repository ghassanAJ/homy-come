import 'package:equatable/equatable.dart';

enum ImagePickerErrorType {
  permissionDenied,
  sourceUnavailable,
  fileError,
  unknown,
}

abstract class ImagePickerResult extends Equatable {
  const ImagePickerResult();

  T when<T>({
    required T Function(String path) success,
    required T Function(ImagePickerErrorType type, String message) error,
    required T Function() cancelled,
  }) {
    if (this is ImagePickerSuccess) {
      return success((this as ImagePickerSuccess).path);
    } else if (this is ImagePickerError) {
      final errorResult = this as ImagePickerError;
      return error(errorResult.type, errorResult.message);
    } else if (this is ImagePickerCancelled) {
      return cancelled();
    }
    throw UnimplementedError('Unknown ImagePickerResult type: $runtimeType');
  }

  bool get isSuccess => this is ImagePickerSuccess;
  bool get isError => this is ImagePickerError;
  bool get isCancelled => this is ImagePickerCancelled;
}

class ImagePickerSuccess extends ImagePickerResult {
  final String path;

  const ImagePickerSuccess(this.path);

  @override
  List<Object?> get props => [path];
}

class ImagePickerError extends ImagePickerResult {
  final ImagePickerErrorType type;
  final String message;

  const ImagePickerError(this.type, this.message);

  @override
  List<Object?> get props => [type, message];
}

class ImagePickerCancelled extends ImagePickerResult {
  const ImagePickerCancelled();

  @override
  List<Object?> get props => [];
}