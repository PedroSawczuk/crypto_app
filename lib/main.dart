import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/custom_theme.dart';
import 'view/crypto_list_page.dart';
import 'viewModel/crypto_controller.dart';

void main() {
  final CryptoController cryptoController = Get.put(CryptoController());
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: CryptoListPage()));
}

