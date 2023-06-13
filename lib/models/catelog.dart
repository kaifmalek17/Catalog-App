class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
      id: "Malek001",
      name: "iPhone 12 Pro",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://www.smartcellular.in/media/catalog/product/cache/cfaa1692031f009488d1cfea5ce7e1ee/a/p/apple-iphone-12-pro-max-dummyapplefsn-original-imafwgcyhmzhaapd_1.jpeg")
];
