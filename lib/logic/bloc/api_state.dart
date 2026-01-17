import 'package:weather/data/models/post_model.dart';

sealed class ApiState {}

final class InitialState extends ApiState {}

final class ApiSuccessState extends ApiState {
  List<PostModel> model;
  ApiSuccessState(this.model);
}

final class ApiFailureState extends ApiState {
  String failureMsg;
  ApiFailureState(this.failureMsg);
}

final class ApiLoadingState extends ApiState {}
