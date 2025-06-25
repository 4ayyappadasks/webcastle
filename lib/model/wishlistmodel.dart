import 'package:get/get.dart';

class WishlistItem {
  final String productName;
  final int productid;
  RxInt count;

  WishlistItem({required this.productName, required this.productid,int initialCount = 0}) : count = initialCount.obs;
}
