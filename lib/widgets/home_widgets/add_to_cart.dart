import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/core/store.dart';
import 'package:mine_app/models/cart.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;
  AddToCart({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    VxStateProvider.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catelog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(8),
        ),
        backgroundColor: MaterialStateProperty.all(Mytheme.darkBluish),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catelog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

class VxStateProvider {
  static void watch(BuildContext context, {required List<Type> on}) {}
}
