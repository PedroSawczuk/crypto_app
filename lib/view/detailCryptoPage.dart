import 'package:cryptoinfo/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class DetailCryptoPage extends StatelessWidget {
  final CryptoModel crypto;
  const DetailCryptoPage({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final NumberFormat cryptoValueFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    
    final DateTime lastUpdated = DateTime.parse(crypto.lastUpdated);
    final String lastUpdatedFormatter = DateFormat('dd/MM/yyyy, HH:mm').format(lastUpdated);

    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.cryptoName),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.network(
              crypto.image,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            Text(
              crypto.cryptoName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              'Símbolo: ${crypto.symbol.toUpperCase()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: ${cryptoValueFormatter.format(crypto.price)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Capitalização de Mercado: ${cryptoValueFormatter.format(crypto.marketCap)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Volume: ${cryptoValueFormatter.format(crypto.volume)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                crypto.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Última atualização: $lastUpdatedFormatter',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}