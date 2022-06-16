import 'package:coctails/data/remote_data_source.dart';
import 'package:coctails/features/main_screen/bloc/mainscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/overall_widgets.dart';
import '../../domain/main_screen_repository.dart';

RemoteDataSource remoteDataSource = RemoteDataSource();

MainScreenRepository mainScreenRepository =
    MainScreenRepository(remoteDataSource);

class MainScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainscreenBloc(mainScreenRepository),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarManager.mainAppBar('Coctails', context),
          body: BlocBuilder<MainscreenBloc, MainscreenState>(
            builder: (context, state) {
              if (state is MainscreenInitial) {
                context.read<MainscreenBloc>().add(MainscreenLoadEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MainscreenLoaded) {
                var drinks = state.coctails.drinks!;
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
