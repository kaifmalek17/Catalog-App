import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/utills/routes.dart';
import 'package:mine_app/widgets/home_widgets/catelog_header.dart';
import 'package:mine_app/widgets/home_widgets/catelog_list.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int num = 8;

  final String name = 'Kaif';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString('assets/files/catelog.json');
    final decodedData = jsonDecode(catelogJson);
    var productsData = decodedData['products'];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: Mytheme.darkBluish,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatelogHeader(),
              // ignore: unnecessary_null_comparison
              if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                const CatelogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
