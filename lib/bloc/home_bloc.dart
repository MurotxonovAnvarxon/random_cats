import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_cats/data/source/model/cat_model.dart';

import '../data/remote/api_client.dart';
import '../di/my_di.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final apiClient = getIt<ApiClient>();

  HomeBloc() : super(HomeState()) {
    on<InitialEvent>((event, emit) async {
      emit(state.copyWith(status: Status.Loading));
      try {
        final getModel = await apiClient.getFacts();
        final int index = Random().nextInt(5);
        emit(state.copyWith(status: Status.Success, myModel: getModel[index]));
      } catch (e) {
        emit(state.copyWith(status: Status.Error));
      }
    });
  }
}
