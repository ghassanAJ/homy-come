import 'dart:developer' as developer;

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import 'image_picker_config.dart';
import 'image_picker_result.dart';

@injectable
class ImagePickerService {
  final ImagePicker _picker;

  ImagePickerService() : _picker = ImagePicker();

  Future<ImagePickerResult> pickImage({
    required ImageSource source,
    ImagePickerConfig config = const ImagePickerConfig(),
  }) async {
    try {
      // Check if source is allowed
      if (!_isSourceAllowed(source, config)) {
        return ImagePickerError(
          ImagePickerErrorType.sourceUnavailable,
          'Image source ${source.name} is not allowed by configuration',
        );
      }

      // Request and check permissions
      final permissionResult = await _requestPermissions(source);
      if (!permissionResult.isGranted) {
        return ImagePickerError(
          ImagePickerErrorType.permissionDenied,
          permissionResult.message,
        );
      }

      // Pick image with configuration
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality,
        preferredCameraDevice: config.cameraDevice,
      );

      if (pickedFile == null) {
        return const ImagePickerCancelled();
      }

      return ImagePickerSuccess(pickedFile.path);
    } catch (error, stackTrace) {
      developer.log(
        'Failed to pick image',
        error: error,
        stackTrace: stackTrace,
      );
      
      return ImagePickerError(
        ImagePickerErrorType.unknown,
        'Failed to select image: ${error.toString()}',
      );
    }
  }

  Future<ImagePickerResult> pickMultipleImages({
    ImagePickerConfig config = const ImagePickerConfig(),
  }) async {
    try {
      // Multi-image picker only works with gallery
      if (!config.isGalleryAllowed) {
        return const ImagePickerError(
          ImagePickerErrorType.sourceUnavailable,
          'Gallery access is required for multiple image selection',
        );
      }

      // Request gallery permissions
      final permissionResult = await _requestPermissions(ImageSource.gallery);
      if (!permissionResult.isGranted) {
        return ImagePickerError(
          ImagePickerErrorType.permissionDenied,
          permissionResult.message,
        );
      }

      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality,
      );

      if (pickedFiles.isEmpty) {
        return const ImagePickerCancelled();
      }

      // Return first image for now (can be extended to return multiple)
      return ImagePickerSuccess(pickedFiles.first.path);
    } catch (error, stackTrace) {
      developer.log(
        'Failed to pick multiple images',
        error: error,
        stackTrace: stackTrace,
      );
      
      return ImagePickerError(
        ImagePickerErrorType.unknown,
        'Failed to select images: ${error.toString()}',
      );
    }
  }

  bool _isSourceAllowed(ImageSource source, ImagePickerConfig config) {
    switch (source) {
      case ImageSource.camera:
        return config.isCameraAllowed;
      case ImageSource.gallery:
        return config.isGalleryAllowed;
    }
  }

  Future<_PermissionResult> _requestPermissions(ImageSource source) async {
    try {
      bool hasPermission = false;
      String errorMessage = '';

      if (source == ImageSource.camera) {
        final permission = await Permission.camera.request();
        hasPermission = permission == PermissionStatus.granted;
        if (!hasPermission) {
          errorMessage = 'Camera permission is required to take photos. Please grant access in settings.';
        }
      } else {
        // For gallery, try multiple permissions based on Android version
        final storagePermission = await Permission.storage.request();
        final photosPermission = await Permission.photos.request();
        
        // Grant access if any of the permissions are granted
        hasPermission = storagePermission == PermissionStatus.granted || 
                       photosPermission == PermissionStatus.granted ||
                       storagePermission == PermissionStatus.limited ||
                       photosPermission == PermissionStatus.limited;
        
        if (!hasPermission) {
          errorMessage = 'Gallery permission is required to select photos. Please grant access in settings.';
        }
      }

      return _PermissionResult(
        isGranted: hasPermission,
        message: errorMessage,
      );
    } catch (error) {
      return _PermissionResult(
        isGranted: false,
        message: 'Failed to request permissions: ${error.toString()}',
      );
    }
  }
}

class _PermissionResult {
  final bool isGranted;
  final String message;

  const _PermissionResult({
    required this.isGranted,
    required this.message,
  });
}