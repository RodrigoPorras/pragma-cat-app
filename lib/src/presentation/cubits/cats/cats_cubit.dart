import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/domain/repositories/the_cat_api_repository.dart';
import 'package:pragma_cat_app/src/utils/resources/data_state.dart';

part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  final TheCatApiRepository _theCatApiRepository;

  CatsCubit(this._theCatApiRepository) : super(CatsLoading());

  Future<void> getCats() async {
    final response = await _theCatApiRepository.getCats();

    if (response is DataSuccess) {
      emit(CatsSuccess(cats: response.data!));
    } else {
      emit(CatsFailed(error: response.error));
    }
  }

  Future<void> filterByBreed({required String breed}) async {
    if(breed.isEmpty){
      emit(CatsSuccess(cats: state.cats));
      return;
    }
    final dataFiltered =
        state.cats!.where((cat) => cat.name.toLowerCase().contains(breed.toLowerCase())).toList();
    emit(CatsFiltered(cats: state.cats, filteredCats: dataFiltered));
  }
}
