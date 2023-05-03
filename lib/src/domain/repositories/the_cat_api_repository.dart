import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/utils/resources/data_state.dart';

abstract class TheCatApiRepository {
  Future<DataState<List<Cat>>> getCats();
}
