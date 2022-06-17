import 'Cart.dart';

class Order {
  final List<Cart> carts;
  final String branchName;
  final int total;
  final String dateOrder;
  Order({required this.carts, required this.branchName, required this.total, required this.dateOrder});
  }

  List<Order> demoOrders = [
  Order(carts: [demoCarts[0], demoCarts[1], demoCarts[2]], branchName: "Chi nhánh quận 9", total: 100,dateOrder: "07-01-2022"),
  Order(carts: [demoCarts[0], demoCarts[1], demoCarts[2]], branchName: "Chi nhánh quận 1", total: 200,dateOrder: "08-01-2022"),
  Order(carts: [demoCarts[0], demoCarts[1], demoCarts[2]], branchName: "Chi nhánh quận 3", total: 300 ,dateOrder: "09-01-2022"),
];
