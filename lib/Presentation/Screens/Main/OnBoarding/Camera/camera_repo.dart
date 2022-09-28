import 'package:image_picker/image_picker.dart';

class CameraRepo {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> get cameraImage =>
      _picker.pickImage(source: ImageSource.camera);
  Future<XFile?> get galleryImage =>
      _picker.pickImage(source: ImageSource.gallery);
}
