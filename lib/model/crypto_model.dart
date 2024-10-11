class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;
  double marketCap;
  double volume;
  String description;
  String lastUpdated; 

  CryptoModel({
    required this.cryptoName,
    required this.price,
    required this.symbol,
    required this.image,
    required this.marketCap,
    required this.volume,
    required this.description,
    required this.lastUpdated, 
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      cryptoName: json['name'],
      price: json['current_price'].toDouble(),
      symbol: json['symbol'],
      image: json['image'],
      marketCap: json['market_cap'].toDouble(),
      volume: json['total_volume'].toDouble(),
      description: json['description'] != null ? json['description'] : 'Sem descrição dessa CryptoMoeda!',
      lastUpdated: json['last_updated'], 
    );
  }
}
