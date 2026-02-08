import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

enum ImagePickerSourceOption {
  camera,
  gallery,
  both,
}

class ImagePickerConfig extends Equatable {
  final int imageQuality;
  final double? maxWidth;
  final double? maxHeight;
  final ImagePickerSourceOption allowedSources;
  final bool preferredCameraDevice;

  const ImagePickerConfig({
    this.imageQuality = 85,
    this.maxWidth = 1080,
    this.maxHeight = 1080,
    this.allowedSources = ImagePickerSourceOption.both,
    this.preferredCameraDevice = false,
  });

  bool get isCameraAllowed => 
    allowedSources == ImagePickerSourceOption.camera || 
    allowedSources == ImagePickerSourceOption.both;

  bool get isGalleryAllowed => 
    allowedSources == ImagePickerSourceOption.gallery || 
    allowedSources == ImagePickerSourceOption.both;

  CameraDevice get cameraDevice => 
    preferredCameraDevice ? CameraDevice.front : CameraDevice.rear;

  ImagePickerConfig copyWith({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
    ImagePickerSourceOption? allowedSources,
    bool? preferredCameraDevice,
  }) {
    return ImagePickerConfig(
      imageQuality: imageQuality ?? this.imageQuality,
      maxWidth: maxWidth ?? this.maxWidth,
      maxHeight: maxHeight ?? this.maxHeight,
      allowedSources: allowedSources ?? this.allowedSources,
      preferredCameraDevice: preferredCameraDevice ?? this.preferredCameraDevice,
    );
  }

  @override
  List<Object?> get props => [
        imageQuality,
        maxWidth,
        maxHeight,
        allowedSources,
        preferredCameraDevice,
      ];
}