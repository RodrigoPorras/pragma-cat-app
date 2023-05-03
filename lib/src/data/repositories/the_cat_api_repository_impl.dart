import 'package:pragma_cat_app/src/data/datasources/remote/the_cat_api_service.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/domain/repositories/the_cat_api_repository.dart';
import 'package:pragma_cat_app/src/utils/resources/data_state.dart';
import 'package:pragma_cat_app/src/data/base/base_api_repository.dart';

class TheCatApiRepositoryImpl extends BaseApiRepository
    implements TheCatApiRepository {
  final TheCatApiService _theCatApiService;

  TheCatApiRepositoryImpl(this._theCatApiService);

  @override
  Future<DataState<List<Cat>>> getCats() {
    return getStateOf<List<Cat>>(
      request: () => _theCatApiService.getCats(),
    );
  }
}
