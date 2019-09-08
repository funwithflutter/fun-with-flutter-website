import 'package:bloc/bloc.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/dataprovider/blog_data_provider.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';
import 'package:fun_with_flutter/themes.dart';

import 'package:fun_with_flutter/utils/route_generator.dart';
import 'package:fun_with_flutter/repository/url_repository.dart';

import 'blocs/bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {

  fb.initializeApp(
      apiKey: "AIzaSyD8JoU_58xKlQFvva7nS7VHTKc1vUkaosk",
      authDomain: "fun-with.firebaseapp.com",
      databaseURL: "https://fun-with.firebaseio.com",
      projectId: "fun-with",
      storageBucket: "fun-with.appspot.com",
      messagingSenderId: "1006728819313",
    );

    
    fb.auth().signInWithEmailAndPassword('test@email.com', 'strongPass').then((value) {
      print(value.user.email);
    }).catchError((error) {
      print(error);
    });

    fb.Database db = fb.database();
    fb.DatabaseReference ref = db.ref("messages");


    ref.onValue.listen((e) {
      fb.DataSnapshot datasnapshot = e.snapshot;
    });
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String uri = blogDataUrl;
    final BlogBloc blogBloc = BlogBloc(
      blogRepository: BlogRepository(
        blogDataProvider: BlogDataProvider(uri),
      ),
    );

    return BlocProvider(
      builder: (context) {
        return blogBloc..dispatch(Fetch());
      }, //Load the Blog data
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FilteredBlogBloc>(
            builder: (context) {
              return FilteredBlogBloc(blogBloc: blogBloc);
            },
          ),
          BlocProvider<PageBloc>(
            builder: (context) {
              return PageBloc();
            },
          )
        ],
        child: MaterialApp(
          title: 'Fun with Flutter',
          theme: AppTheme.theme(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
