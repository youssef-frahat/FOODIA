import 'package:flutter/material.dart';
import '../../data/model/get_home_foods_model/datum.dart';
import 'order_card_widget.dart';

class SearchResultScreen extends StatelessWidget {
  final String searchQuery;
  final List<FoodsModel> allFoods;

  const SearchResultScreen({
    super.key,
    required this.searchQuery,
    required this.allFoods,
  });

  @override
  Widget build(BuildContext context) {
    final filteredFoods =
        allFoods
            .where(
              (food) =>
                  food.name!.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('نتائج البحث عن "$searchQuery"'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body:
          filteredFoods.isEmpty
              ? const Center(child: Text('لا توجد نتائج مطابقة'))
              : ListView.builder(
                itemCount: filteredFoods.length,
                itemBuilder: (context, index) {
                  final food = filteredFoods[index];
                  return OrderWidget(getHomeFoodsModel: food);
                },
              ),
    );
  }
}
