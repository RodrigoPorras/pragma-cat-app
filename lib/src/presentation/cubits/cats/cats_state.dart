part of 'cats_cubit.dart';

abstract class CatsState extends Equatable {
  final List<Cat>? cats;
  final List<Cat>? filteredCats;
  final DioError? error;

  const CatsState({this.cats, this.error, this.filteredCats});

  @override
  List<Object> get props => [cats ?? [],filteredCats ?? [],error ?? 0];
}

class CatsLoading extends CatsState {}

class CatsSuccess extends CatsState {
  const CatsSuccess({super.cats});
}

class CatsFailed extends CatsState {
  const CatsFailed({super.error});
}

class CatsFiltered extends CatsState {
  const CatsFiltered({super.cats,super.filteredCats});
}
