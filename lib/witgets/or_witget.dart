import 'package:flutter/material.dart';
import 'package:foodia_app/styling/app_fonts.dart';

class OrWitget extends StatelessWidget {
  const OrWitget({super.key});

  @override
  Widget build(BuildContext context) {
    return                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 1,
                          color: const Color.fromARGB(255, 71, 71, 71),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppFonts.mainfontsname,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Divider(thickness: 1, color: Colors.blueGrey),
                      ),
                    ],
                  );
  }
}