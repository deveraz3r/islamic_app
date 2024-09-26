import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_filters/view_model/quran_controller.dart';

// TODO: remove para search functions
class TextFeildController extends GetxController {
  QuranController _quranController = Get.find();

  var showCloseButton = false.obs;
  var isBlocked = false.obs;
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    // Add listener to FocusNode
    focusNode.addListener(() {
      if (focusNode.hasFocus && !isBlocked.value) {
        enableListener();
      }
    });
  }

  void enableListener() {
    showCloseButton.value = true;
    textController.addListener(() async{
      _quranController.searchBySurahName(surahNameRoman: textController.text);
      if(textController.text.isNumericOnly){
        _quranController.searchByParahNo(parahNo: int.parse(textController.text));
      }
      else{
        _quranController.searchByParahName(parahNameRoman: textController.text);
      }
    });
  }

  void disableListener() {
    showCloseButton.value = false;
    isBlocked.value = true;
    textController.removeListener(_textListener);
    textController.clear();
    _quranController.loadSurahList();
    _quranController.loadParahs();

    // Unfocus and reset the block after a short delay
    focusNode.unfocus();
    Future.delayed(Duration(milliseconds: 200), () {
      isBlocked.value = false;
    });
  }

  void _textListener() {
    print('Text changed: ${textController.text}');
  }

  @override
  void onClose() {
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}