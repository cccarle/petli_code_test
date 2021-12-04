import 'package:flutter/material.dart';
import 'package:petli_code/models/photo.dart';

class ListItemCard extends StatelessWidget {
  ListItemCard(
    this.photo,
  );

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    displayFullScreenImage() => showGeneralDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.6),
          barrierDismissible: true,
          barrierLabel: 'Dialog',
          transitionDuration: Duration(
            milliseconds: 400,
          ),
          pageBuilder: (_, __, ___) {
            return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SizedBox.expand(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 39,
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox.expand(
                        child: Image.network(photo.url),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

    renderCircleAvatar() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.network(photo.thumbnailUrl),
                ),
              ),
            ],
          ),
        );

    renderImagePreview() => GestureDetector(
          onTap: () => displayFullScreenImage(),
          child: Image.network(
            photo.url,
            fit: BoxFit.cover,
          ),
        );

    renderTitle() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            photo.title,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        );

    renderLikeIcon() => GestureDetector(
          onTap: () => photo.toggelLike(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: ValueListenableBuilder(
              valueListenable: photo.isLiked,
              builder: (context, bool isFavorited, child) => Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border_rounded,
              ),
            ),
          ),
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
            renderLikeIcon(),
            renderTitle(),
          ],
        ),
      ),
    );
  }
}
