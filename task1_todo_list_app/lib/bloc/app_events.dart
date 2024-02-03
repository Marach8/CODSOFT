import 'package:flutter/material.dart';

@immutable
abstract class AppEvents{
  const AppEvents();
}

@immutable 
class GoToGetUserDataViewAppEvent extends AppEvents{
  const GoToGetUserDataViewAppEvent();
}

@immutable 
class GoToLandingPageAppEvent extends AppEvents{
  const GoToLandingPageAppEvent();
}

@immutable 
class AddPhotoAppEvent extends AppEvents{
  const AddPhotoAppEvent();
}

@immutable 
class GoToTodoHomeAppEvent extends AppEvents{
  final String? username;
  const GoToTodoHomeAppEvent({
    this.username
  });
}

@immutable 
class InitializationAppEvent extends AppEvents{
  const InitializationAppEvent();
}

@immutable 
class GoToAddTodoViewAppEvent extends AppEvents{
  const GoToAddTodoViewAppEvent();
}

@immutable 
class SaveTodoAppEvent extends AppEvents{
  final String title, 
  dueDateTime, content;

  const SaveTodoAppEvent({
    required this.title,
    required this.dueDateTime,
    required this.content
  });
}