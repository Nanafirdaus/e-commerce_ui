// ignore: file_names
class Product {
  String? name;
  String? imageUrl;
  String? price;
  String? description;
  int? count;
  bool? isLiked;

  Product({
    this.name,
    this.imageUrl,
    this.price,
    this.description,
  })  : count = 0,
        isLiked = false;

  void incrementCount() {
    if (count! < 10) {
      count = count! + 1;
    }
  }

  void decrementCount() {
    if (count != 0) {
      count = count! - 1;
    }
  }
}
