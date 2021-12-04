import 'package:flutter/material.dart';
import 'package:petli_code/widgets/list_item_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              ListItemCard(),
            ],
          ),
        ),
      ),
    );
  }
}
