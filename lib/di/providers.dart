import "package:flutter/material.dart";
import 'package:onetime/models/db/database_manager.dart';
import 'package:onetime/repositories/post_repository.dart';
import 'package:onetime/repositories/user_repository.dart';
import 'package:onetime/view_models/login_view_model_google.dart';
import 'package:onetime/view_models/post_view_model.dart';
import "package:provider/provider.dart";
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (context) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (context, dbManager, repo) => UserRepository(dbManager: dbManager),
  ),
  //TODO
  ProxyProvider<DatabaseManager, PostRepository>(
    update: (context, dbManager, repo) => PostRepository(),
  ),


];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false)
),
),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: Provider.of<UserRepository>(context, listen: false),
      postRepository: Provider.of<PostRepository>(context, listen: false),
    ),
  ),

];
