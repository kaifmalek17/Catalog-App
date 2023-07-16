import 'package:flutter/material.dart';
import 'package:mine_app/models/cart.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/pages/home_detail_page.dart';
import 'package:mine_app/widgets/home_widgets/catelog_image.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catelog: catelog,
              ),
            ),
          ),
          child: CatelogItem(catelog: catelog),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      // ignore: unnecessary_null_comparison
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(
              catelog.id.toString(),
            ),
            child: CatelogImage(
              image: catelog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catelog.name.text.lg.color(Mytheme.darkBluish).bold.make(),
                catelog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  children: [
                    '\$${catelog.price}'.text.bold.xl.make(),
                    _AddToCart(catelog: catelog),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catelog;
  const _AddToCart({super.key, required this.catelog});

  @override
  State<_AddToCart> createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
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
        isAdded = isAdded.toggle();
        final _catelog = CatelogModel();
        final _cart = CartModel();
        _cart.catelog = _catelog;
        _cart.add(widget.catelog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
