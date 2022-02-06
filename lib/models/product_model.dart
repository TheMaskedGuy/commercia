class Product {
  final int prodID;
  final String prodName, prodDecr;

  Product(
      {required this.prodID, required this.prodName, required this.prodDecr});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      prodID: json['id'], prodName: json['name'], prodDecr: json['descr']);

  static List<Product> fromJsonArray(List<dynamic> jsonArray) {
    List<Product> productsFromJson = [];

    jsonArray.forEach((jsonData) {
      productsFromJson.add(Product.fromJson(jsonData));
      print(Product.fromJson(jsonData).prodName);
    });

    return productsFromJson;
  }
}
