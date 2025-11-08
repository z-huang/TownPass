import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:town_pass/util/tp_dialog.dart';

class NFCScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startNFCScan();
  }

  @override
  void onClose() {
    _stopNFCScan();
    super.onClose();
  }

  Future<void> _startNFCScan() async {
    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          final String tagData = tag.toString();
          await _stopNFCScan();
          Get.back(result: tagData);
        },
        pollingOptions: const {},
      );
    } catch (e) {
      await TPDialog.showError(title: '錯誤', content: '無法啟動NFC掃描: $e');
      Get.back();
    }
  }

  Future<void> _stopNFCScan() async {
    await NfcManager.instance.stopSession();
  }
}
