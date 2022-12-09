import 'dart:ui';

import 'package:image_picker/image_picker.dart';

//
// class PhotoHelper {
//   final ImagePicker? photoPicker;
//   const PhotoHelper({
//     required this.photoPicker
//   });
// }

class PhotoHelper {
  final ImagePicker? _photoPicker;

  PhotoHelper({ImagePicker? photoPicker})
      : _photoPicker = photoPicker ?? ImagePicker();

  Future<List<XFile>?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (multiple) {
      return await _photoPicker?.pickMultiImage(imageQuality: imageQuality);
    }
    final file = await _photoPicker?.pickImage(
      source: source,
      imageQuality: imageQuality,
    );

    if (file != null) return [file];

    return [];
  }
}
