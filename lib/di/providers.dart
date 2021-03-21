import "package:flutter/material.dart";
import 'package:onetime/models/db/database_manager.dart';
import 'package:onetime/repositories/user_repository.dart';
import 'package:onetime/view_models/login_view_model_google.dart';
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
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false)),
  ),
];
