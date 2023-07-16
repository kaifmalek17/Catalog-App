import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/models/cart.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catelog;
  const AddToCart({super.key, required this.catelog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catelog) ?? false;
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
          isInCart = isInCart.toggle();
          final _catelog = CatelogModel();
          _cart.catelog = _catelog;
          _cart.add(widget.catelog);
          setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
