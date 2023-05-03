import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pragma_cat_app/src/config/labels.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/presentation/views/widgets/my_image.dart';

@RoutePage()
class CatDetailView extends StatelessWidget {
  final Cat cat;
  const CatDetailView({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat.name)),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: MyImage(referenceImageId: cat.referenceImageId),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                cat.description,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 16.0),
              Text(
                '${labels.originCountry}: ${cat.origin}',
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                '${labels.intelligence}: ${cat.intelligence}',
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                '${labels.adaptability}: ${cat.adaptability}',
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                '${labels.lifeSpan}: ${cat.lifeSpan}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
