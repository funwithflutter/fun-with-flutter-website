// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:fun_with_flutter/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fun_with_flutter/infrastructure/auth/firebase_auth_facade.dart';
import 'package:fun_with_flutter/domain/auth/i_auth_facade.dart';
import 'package:fun_with_flutter/infrastructure/blog/blog_repository.dart';
import 'package:fun_with_flutter/domain/blog/i_blog_repository.dart';
import 'package:fun_with_flutter/infrastructure/blog/dev_blog_repository.dart';
import 'package:fun_with_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:fun_with_flutter/infrastructure/blog/blog_injectable_module.dart';
import 'package:fun_with_flutter/application/auth/auth_bloc.dart';
import 'package:fun_with_flutter/application/blog/blog_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<String>(() => registerModule.baseUrl,
      instanceName: 'BaseUrl');
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthFacade>()));
  g.registerFactory<BlogBloc>(() => BlogBloc(g<IBlogRepository>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerFactory<IBlogRepository>(() => BlogRepository());
  }

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerFactory<IBlogRepository>(() => DevBlogRepository());
  }
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$RegisterModule extends RegisterModule {}
