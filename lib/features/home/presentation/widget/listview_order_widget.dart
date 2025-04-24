import 'package:flutter/material.dart';

import 'order_card_widget.dart';

class ListviewOrderWidget extends StatelessWidget {
  const ListviewOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) => const OrderWidget(),
      ),
    );
  }
}
