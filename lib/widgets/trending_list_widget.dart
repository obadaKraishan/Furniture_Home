import 'package:flutter/material.dart';

class TrendingListWidget extends StatelessWidget {
  final List<String> trendingList;

  TrendingListWidget({required this.trendingList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
        itemCount: trendingList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.0),
                      height: MediaQuery.of(context).size.width / 2 * 0.85,
                      width: double.infinity,
                      child: Image.asset(
                        trendingList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite_border, color: Color(0xFF474648)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '€${(index + 1) * 100}',
                        style: TextStyle(color: Color(0xFF474648), fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Product ${index + 1}',
                        style: TextStyle(color: Color(0xFF474648)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
