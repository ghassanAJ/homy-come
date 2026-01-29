import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseImagePicker {
  Future<File?> pickPhotoFromGallery();
  Future<File?> pickPhotoFromCamera();
}

class ImagePickerStrategy implements BaseImagePicker {
  @override
  Future<File?> pickPhotoFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  @override
  Future<File?> pickPhotoFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}

abstract class BasePhotoPicker extends StatefulWidget {
  final String? photoPath;
  final String? photoUrl;
  final ValueChanged<File?> onPhotoPicked;
  const BasePhotoPicker({
    super.key,
    required this.onPhotoPicked,
    this.photoPath,
    this.photoUrl,
  });

  @override
  State<BasePhotoPicker> createState() => _BasePhotoPickerState();

  BaseImagePicker get imagePicker;

  Widget buildPickerWidget(
    BuildContext context,
    String? photoPath,
    String? photoUrl,
    VoidCallback onPickPhoto,
  );
}

class _BasePhotoPickerState extends State<BasePhotoPicker> {
  String? _photoPath;
  Future<void> _pickPhoto(BuildContext context) async {
    UIImageSelectionBottomSheet.show(
      showDelete: _photoPath != null && _photoPath!.isNotEmpty,
      onDelete: () {
        setState(() {
          _photoPath = null;
        });
        context.pop();
      },
      context: context,
      onChooseFromLibrary: () async {
        final File? pickedFile =
            await widget.imagePicker.pickPhotoFromGallery();

        widget.onPhotoPicked(pickedFile);
        if (!context.mounted) return;
        context.pop();
        if (pickedFile != null) {
          setState(() {
            _photoPath = pickedFile.path;
          });
        }
      },
      onTakePhoto: () async {
        final File? pickedFile = await widget.imagePicker.pickPhotoFromCamera();
        widget.onPhotoPicked(pickedFile);
        if (!context.mounted) return;
        context.pop();
        if (pickedFile != null) {
          setState(() {
            _photoPath = pickedFile.path;
          });
        }
      },
    );

    // }
  }

  @override
  void initState() {
    _photoPath = widget.photoPath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.buildPickerWidget(
    context,
    _photoPath,
    widget.photoUrl,
    () => _pickPhoto(context),
  );
}
