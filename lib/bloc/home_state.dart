part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final MyModel? myModel;

  HomeState({
    this.status,
    this.myModel,
  });

  HomeState copyWith({
    Status? status,
    MyModel? myModel,
  }) =>
      HomeState(
          status: status ?? this.status, myModel: myModel ?? this.myModel);
}

enum Status { Loading, Success, Error, Initial }
