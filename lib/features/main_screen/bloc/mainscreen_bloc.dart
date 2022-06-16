import 'package:bloc/bloc.dart';
import 'package:coctails/domain/main_screen_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/coctails_responce/coctails/coctails.dart';

part 'mainscreen_event.dart';
part 'mainscreen_state.dart';

class MainscreenBloc extends Bloc<MainscreenEvent, MainscreenState> {
  final MainScreenRepository _mainScreenRepository;

  MainscreenBloc(this._mainScreenRepository) : super(MainscreenInitial()) {
    on<MainscreenLoadEvent>(onMainscreenLoadEvent);
  }

  onMainscreenLoadEvent(event, emit) async {
    Coctails coctails = await _mainScreenRepository.getCoctails();
    emit(MainscreenLoaded(coctails: coctails));
  }
}
