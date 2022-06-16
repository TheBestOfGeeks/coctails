import 'package:coctails/data/remote_data_source.dart';
import 'package:coctails/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/overall_widgets.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarManager.mainAppBar('Favorites', context),
          body: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesInitial) {
                context.read<FavoritesBloc>().add(FavoriteLoadEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavoritesLoaded) {
                var drinks = state.drinks;
                return CustomListWiew(
                  drinks: drinks,
                  itemCount: drinks.length,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
