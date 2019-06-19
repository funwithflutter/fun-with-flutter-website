import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/about/data/data.dart';
import 'package:fun_with_flutter/screens/home/data/category_data.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Hero(
                tag: aboutTag,
                child: Image.asset('images/fun_with_flutter.png',
                    fit: BoxFit.contain),
              ),
            ),
            // Text(aboutIntro),
            aboutIntro(),
          ],
        ),
      ),
    );
  }
}
