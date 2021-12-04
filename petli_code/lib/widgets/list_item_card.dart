import 'package:flutter/material.dart';

class ListItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    renderCircleAvatar() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child:
                      Image.network('https://via.placeholder.com/600/92c952'),
                ),
              ),
            ],
          ),
        );

    renderImagePreview() => GestureDetector(
          onTap: () => print('open modal'),
          child: Image.network(
            'https://via.placeholder.com/600/92c952',
            fit: BoxFit.cover,
          ),
        );

    renderTitle() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Some text'),
        );

    renderLikeIcon() => Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Icon(Icons.favorite),
        );

    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderCircleAvatar(),
            renderImagePreview(),
            renderTitle(),
            renderLikeIcon(),
          ],
        ),
      ),
    );
  }
}
