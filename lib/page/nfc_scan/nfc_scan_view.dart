import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:town_pass/page/nfc_scan/nfc_scan_controller.dart';
import 'package:town_pass/util/tp_app_bar.dart';
import 'package:town_pass/util/tp_colors.dart';
import 'package:town_pass/util/tp_text.dart';

class NFCScanView extends GetView<NFCScanController> {
  const NFCScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TPAppBar(
        title: 'NFC掃描',
        leading: const SizedBox.shrink(),
        actions: const [
          CloseButton(
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll<double>(24),
            ),
          ),
        ],
      ),
      backgroundColor: TPColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.nfc,
              size: 80,
              color: TPColors.white,
            ),
            SizedBox(height: 24),
            TPText(
              '請將裝置靠近NFC標籤',
              style: TPTextStyles.h2SemiBold,
              color: TPColors.white,
            ),
            SizedBox(height: 16),
            TPText(
              '正在掃描中...',
              style: TPTextStyles.bodyRegular,
              color: TPColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
