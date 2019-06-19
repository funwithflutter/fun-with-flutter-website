import 'package:fun_with_flutter/logic/route_generator.dart';
import 'package:fun_with_flutter/screens/home/models/CatergoryModel.dart';

const String aboutTag = 'aboutTag';
const String blogTag = 'blogTag';
const String effectsTag = 'effectTag';
const String designTag = 'designTag';
const String packagesTag = 'packagesTag';
const String snippetsTag = 'snippetsTag';

List<CategoryModel> categoryData = [
  CategoryModel('About', RouteGenerator.aboutRoute, 'todo add image path', aboutTag),
  CategoryModel('Blog', RouteGenerator.blogRoute, 'todo add image path', blogTag),
  CategoryModel('Effects and Widgets', RouteGenerator.effectsRoute, ' todo', effectsTag),
  CategoryModel('Design Challenges', RouteGenerator.designRoute, 'todo', designTag),
  CategoryModel('Packages', RouteGenerator.packagesRoute, 'todo', packagesTag),
  CategoryModel('Snippets', RouteGenerator.snippetsRoute, 'todo', snippetsTag),
];
