import 'package:flutter/material.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/widgets/home_widgets/catelog_image.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({super.key, required this.catelog})
      // ignore: unnecessary_null_comparison
      : assert(catelog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Mytheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          children: [
            '\$${catelog.price}'.text.bold.xl4.red800.make(),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                backgroundColor: MaterialStateProperty.all(Mytheme.darkBluish),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
              onPressed: () {},
              child: 'Buy'.text.make(),
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(
                catelog.id.toString(),
              ),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.xl4
                          .color(Mytheme.darkBluish)
                          .bold
                          .make(),
                      catelog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                    ],
                  ).p64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
