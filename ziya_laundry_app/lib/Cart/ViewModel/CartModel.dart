
////cart model////
class CartItem {
  final String washtype;
  final String picture;
  final String dresstype;
  final int price;
  int qty;

  CartItem({
    required this.washtype,
    required this.picture,
    required this.dresstype,
    required this.price,
    this.qty = 1,
  });
  int get total => price * qty;
}