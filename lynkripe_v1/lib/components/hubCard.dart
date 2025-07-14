
import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';
import '/components/Tags.dart';

class HubCard extends StatelessWidget {
  final String title;
  final String description;
  final String imgSrc;

  const HubCard({
    super.key,
    required this.title,
    required this.description,
    required this.imgSrc    
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 12 / 15,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: hubColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Image.asset('assets/p.jpg'),
                  const SizedBox(height: 8),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.star, size: 18.0, color: vibrantOrange ,),
                        ),
                         IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.hub, size: 18.0, color: successGreen ,),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 18.0),
                        ),
                      ],
                    ),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
