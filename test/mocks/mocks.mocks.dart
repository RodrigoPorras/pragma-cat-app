// Mocks generated by Mockito 5.4.0 from annotations
// in pragma_cat_app/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pragma_cat_app/src/data/repositories/the_cat_api_repository_impl.dart'
    as _i3;
import 'package:pragma_cat_app/src/domain/models/cat.dart' as _i5;
import 'package:pragma_cat_app/src/utils/resources/data_state.dart' as _i2;
import 'package:retrofit/retrofit.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TheCatApiRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockTheCatApiRepositoryImpl extends _i1.Mock
    implements _i3.TheCatApiRepositoryImpl {
  MockTheCatApiRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<List<_i5.Cat>>> getCats() => (super.noSuchMethod(
        Invocation.method(
          #getCats,
          [],
        ),
        returnValue: _i4.Future<_i2.DataState<List<_i5.Cat>>>.value(
            _FakeDataState_0<List<_i5.Cat>>(
          this,
          Invocation.method(
            #getCats,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DataState<List<_i5.Cat>>>);
  @override
  _i4.Future<_i2.DataState<T>> getStateOf<T>(
          {required _i4.Future<_i6.HttpResponse<T>> Function()? request}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStateOf,
          [],
          {#request: request},
        ),
        returnValue: _i4.Future<_i2.DataState<T>>.value(_FakeDataState_0<T>(
          this,
          Invocation.method(
            #getStateOf,
            [],
            {#request: request},
          ),
        )),
      ) as _i4.Future<_i2.DataState<T>>);
}
