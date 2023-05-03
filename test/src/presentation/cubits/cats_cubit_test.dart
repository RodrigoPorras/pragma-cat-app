import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/presentation/cubits/cats/cats_cubit.dart';
import 'package:pragma_cat_app/src/utils/resources/data_state.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  group('CatsCubit', () {
    final theCatApiRepositoryMock = MockTheCatApiRepositoryImpl();
    late CatsCubit catsCubit;

    setUp(() {
      catsCubit = CatsCubit(theCatApiRepositoryMock);
    });

    test('getCats should emit CatsSuccess when getCats returns DataSuccess',
        () async {
      // Arrange
      const cats = [
        Cat(
          name: 'Cat 1',
          adaptability: 1,
          affectionLevel: 1,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
        Cat(
          name: 'Cat 2',
          adaptability: 2,
          affectionLevel: 2,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
      ];
      when(theCatApiRepositoryMock.getCats())
          .thenAnswer((_) async => const DataSuccess<List<Cat>>(cats));

      // Act
      await catsCubit.getCats();

      // Assert
      expect(catsCubit.state, const CatsSuccess(cats: cats));
    });

    test('getCats should emit CatsFailed when getCats returns DataError',
        () async {
      // Arrange
      final error = DioError(requestOptions: RequestOptions());

      when(theCatApiRepositoryMock.getCats())
          .thenAnswer((_) async => DataFailed(error));

      // Act
      await catsCubit.getCats();

      // Assert
      expect(catsCubit.state, CatsFailed(error: error));
    });

    test('filterByBreed should emit CatsSuccess when breed is empty', () {
      // Arrange
      const currentState = CatsSuccess(cats: [
        Cat(
          name: 'Cat 1',
          adaptability: 1,
          affectionLevel: 1,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
        Cat(
          name: 'Cat 2',
          adaptability: 2,
          affectionLevel: 2,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
      ]);
      catsCubit.emit(currentState);

      // Act
      catsCubit.filterByBreed(breed: '');

      // Assert
      expect(catsCubit.state, currentState);
    });

    test('filterByBreed should emit CatsFiltered when breed is not empty', () {
      // Arrange
      const currentState = CatsSuccess(cats: [
        Cat(
          name: 'Siamese',
          adaptability: 1,
          affectionLevel: 1,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
        Cat(
          name: 'Persian',
          adaptability: 2,
          affectionLevel: 2,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
        Cat(
          name: 'Sphinx',
          adaptability: 1,
          affectionLevel: 1,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
      ]);
      catsCubit.emit(currentState);

      // Act
      catsCubit.filterByBreed(breed: 'siam');

      // Assert
      expect(catsCubit.state.filteredCats, const [
        Cat(
          name: 'Siamese',
          adaptability: 1,
          affectionLevel: 1,
          description: '',
          id: 'aaa',
          intelligence: 2,
          lifeSpan: '23',
          origin: 'col',
          referenceImageId: '',
        ),
      ]);
    });
  });
}
