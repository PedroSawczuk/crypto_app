import 'package:cryptoinfo/view/detailCryptoPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewModel/crypto_controller.dart';
import 'package:intl/intl.dart';

class CryptoListPage extends StatelessWidget {
  CryptoListPage({super.key});

  final cryptoController = Get.find<CryptoController>();

  @override
  Widget build(BuildContext context) {
    final NumberFormat cryptoValueFormater = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preços de Criptomoedas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: cryptoController.fetchCryptos,
          ),
        ],
      ),
      body: Obx(() {
        if (cryptoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (cryptoController.cryptos.isEmpty) {
          return const Center(child: Text('Nenhuma criptomoeda encontrada.'));
        } else {
          return ListView.builder(
            itemCount: cryptoController.cryptos.length,
            itemBuilder: (context, index) {
              var crypto = cryptoController.cryptos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Cor da sombra
                        spreadRadius: 2, // Espalhamento da sombra
                        blurRadius: 8, // Borrão da sombra
                        offset: const Offset(4, 4), // Deslocamento da sombra (x, y)
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  child: ListTile(
                    leading: Image.network(
                      crypto.image,
                      width: 40,
                      height: 40,
                    ),
                    onTap: () {
                      Get.to(() => DetailCryptoPage(crypto: crypto));
                    },
                    title: Text(
                      crypto.cryptoName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      crypto.symbol.toUpperCase(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      cryptoValueFormater.format(crypto.price),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
