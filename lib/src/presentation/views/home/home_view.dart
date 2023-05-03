import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pragma_cat_app/src/config/labels.dart';
import 'package:pragma_cat_app/src/config/router/app_router.dart';
import 'package:pragma_cat_app/src/domain/models/cat.dart';
import 'package:pragma_cat_app/src/presentation/cubits/cats/cats_cubit.dart';
import 'package:pragma_cat_app/src/presentation/views/widgets/my_image.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(labels.mainTitle)),
      body: BlocBuilder<CatsCubit, CatsState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: inputController,
                  onFieldSubmitted: (value) {
                    context.read<CatsCubit>().filterByBreed(breed: value);
                  },
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        if (state is CatsFiltered) {
                          inputController.text = '';
                        }
                        context
                            .read<CatsCubit>()
                            .filterByBreed(breed: inputController.text);
                        FocusScope.of(context).unfocus();
                      },
                      child: state is CatsFiltered
                          ? const Icon(Icons.cancel)
                          : const Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                ),
              ),
              Expanded(child: _getContent(context, state))
            ],
          );
        },
      ),
    );
  }

  _getContent(BuildContext context, CatsState state) {
    switch (state.runtimeType) {
      case CatsLoading:
        return const Center(child: CircularProgressIndicator());
      case CatsSuccess:
        return _buildHome(context, state.cats!);
      case CatsFiltered:
        return _buildHome(context, state.filteredCats!);
      case CatsFailed:
        showToast(state.error?.message ?? '');
        return Container();
      default:
        return Container();
    }
  }

  _buildHome(BuildContext context, List<Cat> cats) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: cats
          .map((cat) => Card(
                child: InkWell(
                  onTap: () => context.router.push(CatDetailRoute(cat: cat)),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${labels.breed}: ${cat.name}'),
                            Text(labels.more),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 300,
                          child:
                              MyImage(referenceImageId: cat.referenceImageId),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${labels.originCountry}: ${cat.origin}'),
                            Text('${labels.intelligence} ${cat.intelligence}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
