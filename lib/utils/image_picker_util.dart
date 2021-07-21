import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();
getImage() async {
  final pickedFiled = await picker.getImage(source: ImageSource.camera);
  return pickedFiled;
}
