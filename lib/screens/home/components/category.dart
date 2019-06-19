import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/home/data/category_data.dart';
import 'package:fun_with_flutter/screens/home/models/CatergoryModel.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class CategoryPageViewer extends StatefulWidget {
  @override
  _CategoryPageViewerState createState() => _CategoryPageViewerState();
}

class _CategoryPageViewerState extends State<CategoryPageViewer> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageLeftPressed() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void _onPageRightPressed() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    var categoryLength = categoryData.length;
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          itemCount: (categoryLength / 2).round(),
          itemBuilder: (BuildContext context, int index) {
            var firstIndex = index * 2;
            var secondIndex = firstIndex + 1;
            return Row(
              children: <Widget>[
                _CategoryPanel(
                  categoryModel: categoryData[index * 2],
                  backgroundColor: secondaryColor,
                ),
                if (secondIndex < categoryLength)
                  _CategoryPanel(
                    categoryModel: categoryData[index * 2 + 1],
                    backgroundColor: primaryColor,
                  ),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            iconSize: 48,
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
            onPressed: () {
              _onPageLeftPressed();
            },
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              iconSize: 48,
              icon: Icon(
                Icons.arrow_forward,
                color: secondaryColor,
              ),
              onPressed: () {
                _onPageRightPressed();
                // readFileAsync();
              },
            )),
      ],
    );
  }
}

class _CategoryPanel extends StatelessWidget {
  final CategoryModel categoryModel;
  final Color backgroundColor;

  const _CategoryPanel(
      {Key key,
      @required this.categoryModel,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(categoryModel.route);
        },
        child: Container(
          color: backgroundColor,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: categoryModel.heroTag,
                    child: Image.asset('images/fun_with_flutter.png'),
                  ),
                ),
                Text(
                  categoryModel.title,
                  style: Theme.of(context).textTheme.display3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
