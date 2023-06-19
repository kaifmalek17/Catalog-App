import 'package:flutter/material.dart';
import 'package:mine_app/models/catelog.dart';
import 'package:mine_app/widgets/drawer.dart';
import 'package:mine_app/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int num = 8;
  final String name = 'Kaif';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catelog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatelogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatelogModel.items[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
