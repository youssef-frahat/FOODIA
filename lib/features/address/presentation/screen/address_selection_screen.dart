import 'package:flutter/material.dart';

import '../../../../core/extensions/spacing.dart';
import '../widget/add_new_address_button_widget.dart';
import '../widget/address_card_widget.dart';
import '../widget/next_button_widget.dart';
import '../widget/stepprogress_bar_widget.dart';

class AddressSelectionScreen extends StatelessWidget {
  const AddressSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.orange),
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ExactStepperWidget(),
            verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
               return   AddressCardWidget(
                    city: "سوهاج",
                    address: "مركز سوهاج - حي الثقافة، شارع المدارس، مبني 12",
                    selected: true,
                  );
                },
              ),
            ),
            AddNewAddressButtonWidget(),
            
          ],
        ),
      ),
    );
  }
}
