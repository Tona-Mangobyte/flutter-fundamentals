import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:simple_components/screens/food/widgets/filter.dart';
import 'package:simple_components/screens/food/widgets/food_cart.dart';

import '../../models/food_model.dart';
import 'food_detail_screen.dart';

class ListFoodScreen extends StatefulWidget {
  const ListFoodScreen({Key? key}): super(key: key);

  @override
  State<ListFoodScreen> createState() => _ListFoodScreenState();
}

class _ListFoodScreenState extends State<ListFoodScreen> {
  List<FoodModel> _foods;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foods = initFoods();
  }

  List<FoodModel> initFoods() {
    return [
      FoodModel(
        name: "Idli",
        description: "With spicy Chutney",
        cal: "65",
        price: "30.00",
        image: "assets/images/idli.jpeg",
      ),
      FoodModel(
        name: "Idiyappam",
        description: "With spicy Motton curry",
        cal: "75",
        price: "50.00",
        image: "assets/images/idiyapam.jpeg",
      ),
      FoodModel(
        name: "Ven Pongal",
        description: "With Sambar and Chutney",
        cal: "85",
        price: "40.00",
        image: "assets/images/pongal.png",
      ),
      FoodModel(
        name: "Dosa",
        description: "With spicy Chutney",
        cal: "65",
        price: "60.00",
        image: "assets/images/dosa.png",
      ),
      FoodModel(
        name: "Full Meals",
        description: "With five Side-Dish",
        cal: "128",
        price: "110.00",
        image: "assets/images/meals.png",
      ),
      FoodModel(
        name: "Paniyaram",
        description: "With spicy Chutneyy",
        cal: "43",
        price: "35.00",
        image: "assets/images/paniyaram.png",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final counts = _foods.length;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              const Text(
                "South Indian Foods",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Filter(
                /*onChanged: (value) {
                  print('Filter value: $value');
                  setState(() {
                    if (value.isEmpty) {
                      _foods = initFoods();
                      return;
                    }
                    _foods = _foods.where((element) => element.name.startsWith(value)).toList();
                    print('Filter count: ${_foods.length}');
                  });
                },*/
                controller: _controller,
                onFilter: (value) {
                  print('Filter value: $value');
                  setState(() {
                    if (value.isEmpty) {
                      _foods = initFoods();
                      return;
                    }
                    _foods = _foods.where((element) => element.name.startsWith(value)).toList();
                    print('Filter count: ${_foods.length}');
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Center(
                        child: Text(
                          'Found $counts results',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ..._buildFoodList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFoodList() {
    return _foods.map((e) => InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailScreen(
            foodData: e,
          )),
      ),
      child: FoodCard(foodData: e),
    )).toList();
  }
}