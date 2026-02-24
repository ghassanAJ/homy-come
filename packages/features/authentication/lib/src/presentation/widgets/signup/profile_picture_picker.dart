import 'dart:io';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:util/util.dart';

class ProfilePicturePicker extends StatefulWidget {
  final ValueChanged<File?> onPhotoPicked;

  const ProfilePicturePicker({required this.onPhotoPicked, super.key});

  @override
  State<ProfilePicturePicker> createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker> {
  final BaseImagePicker _imagePicker = ImagePickerStrategy();
  File? _selectedPhoto;

  Future<void> _showImageSourceSheet() async {
    await UIImageSelectionBottomSheet.show(
      context: context,
      showDelete: _selectedPhoto != null,
      onDelete: () {
        setState(() {
          _selectedPhoto = null;
        });
        widget.onPhotoPicked(null);
        Navigator.of(context).pop();
      },
      onChooseFromLibrary: () async {
        final pickedFile = await _imagePicker.pickPhotoFromGallery();
        if (!mounted) return;
        Navigator.of(context).pop();
        if (pickedFile == null) return;
        setState(() {
          _selectedPhoto = pickedFile;
        });
        widget.onPhotoPicked(pickedFile);
      },
      onTakePhoto: () async {
        final pickedFile = await _imagePicker.pickPhotoFromCamera();
        if (!mounted) return;
        Navigator.of(context).pop();
        if (pickedFile == null) return;
        setState(() {
          _selectedPhoto = pickedFile;
        });
        widget.onPhotoPicked(pickedFile);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _showImageSourceSheet,
      child: Row(
        children: [
          _selectedPhoto == null
              ? UIIconBackground(
                size: 57,
                iconSize: 33,
                backgroundColor: UIColor.textPlaceholder,
                child: SvgPicture.asset(
                  Assets.icons.photoCamera,
                  package: 'design_system',
                ),
              )
              : ClipOval(
                child: Image.file(
                  _selectedPhoto!,
                  width: 57,
                  height: 57,
                  fit: BoxFit.cover,
                ),
              ),
          SizedBox(width: UI.spacing.xs),
          UIText.bodySmall(
            tr.personalInfo.addPhoto,
            color: UIColor.neutral300,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
