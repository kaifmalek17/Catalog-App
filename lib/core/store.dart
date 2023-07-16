import 'package:mine_app/models/cart.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogModel catelog;
  late CartModel cart;

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart.catelog = catelog;
  }
}
