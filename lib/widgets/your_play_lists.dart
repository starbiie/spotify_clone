import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class YourPlayLists extends StatelessWidget {
  const YourPlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        // var product = products[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
              child: Container(
                  decoration: BoxDecoration(
                      color: HexColor("FFFFFF").withOpacity(0.20),
                      borderRadius: BorderRadius.circular(7)),
                  height: 100, // Fixed height
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/lofigirl.jpg"),
                            ),
                          ),
                        ),
                        title: Text(
                          "Trading the way",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
