import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/image_picker_example/picker_event.dart';
import 'package:bloc_learn/bloc/image_picker_example/picker_state.dart';
import 'package:bloc_learn/utils/image_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerUtil? imagePickerUtil = ImagePickerUtil();
  ImagePickerBloc({this.imagePickerUtil}) : super(const ImagePickerState()) {
    on<CameraCapture>(_captureCamera);
  }
  Future<void> _captureCamera(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtil!.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
