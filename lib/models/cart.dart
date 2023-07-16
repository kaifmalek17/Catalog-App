import 'package:mine_app/core/store.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catelog fields
  late CatelogModel _catelog;

  // collection of IDs - store ids of each item
  final List<int> _itemIds = [];

  // Get Catelog
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelog) {
    // ignore: unnecessary_null_comparison
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
