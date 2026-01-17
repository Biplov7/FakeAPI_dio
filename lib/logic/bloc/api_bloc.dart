import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/post_model.dart';
import 'package:weather/data/repository/post_repository.dart';
import 'package:weather/logic/bloc/api_event.dart';
import 'package:weather/logic/bloc/api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final PostRepository postRepository;
  ApiBloc(this.postRepository) : super(InitialState()) {
    on<ApiFetched>(_apiBlocFetched);
  }

  void _apiBlocFetched(ApiFetched event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try {
      List<PostModel> result = await postRepository.fetchPost();
      emit(ApiSuccessState(result));
    } catch (e) {
      emit(ApiFailureState(e.toString()));
    }
  }
}
