import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // تفاصيل البيتزا
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // السعر والاسم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'بيتزا فراخ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ج.م 300',
                            style: TextStyle(fontSize: 22, color: Colors.orange),
                          ),
                          Text(
                            'ج.م 350',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text(
                    'وقت التحضير: 20 دقيقة',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),

                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 10),

                  // وصف البيتزا
                  Text(
                    'بيتزا بسيطة يمكن تحضيرها من عجينة رقيقة مفرمشة. تحتوي على مكونات صحية لذيذة مثل الدجاج و الخضروات الطازجة مع جبنة موزاريلا.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),

                  // تفاصيل المراجعة
                  Row(
                    children: [
                      // صورة المستخدم
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/user.jpg'),
                      ),
                      SizedBox(width: 10),
                      // اسم المراجعة
                      Text(
                        'Jana Hatem',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      // تاريخ المراجعة
                      Text(
                        '25/12/2024',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // تعليق المستخدم
                  Text(
                    '"كانت أكلة لذيذة من مطعم طازجة وساخنة، والخدمة ممتازة جدًا. كان المكان محترم جدًا ووجهتهم مميزة جدًا من الشيف والعاملين."',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}