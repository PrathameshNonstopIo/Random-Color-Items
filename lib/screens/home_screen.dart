import 'package:first_app/models/item_model.dart';
import 'package:first_app/state/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, data, child) => Scaffold(
          appBar: AppBar(
            title: const Text("First App"),
            backgroundColor: randomColor(),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ItemModel item = ItemModel(
                        itemName: "Item ${data.items.length}",
                        itemColor: randomColor(),
                      );
                      data.addItem(item);
                    },
                    child: const Text("Add item"),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      data.changeColor(getRandomListColor());
                    },
                    child: const Text("Change color"),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.items.length,
                    itemBuilder: (context, index) {
                      ItemModel currentItem = data.items[index];
                      return Container(
                        margin: const EdgeInsets.all(20),
                        height: 50,
                        color: currentItem.itemColor,
                        child: ListTile(
                          title: Text(currentItem.itemName),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }

  Color randomColor() {
    Color color = Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextDouble());

    return color;
  }

  List<Color> getRandomListColor() {
    List<Color> result = [];
    int length =
        Provider.of<ItemsProvider>(context, listen: false).items.length;

    for (int i = 0; i < length; i++) {
      result.add(randomColor());
    }

    return result;
  }
}
