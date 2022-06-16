part of 'mainscreen_bloc.dart';

abstract class MainscreenState extends Equatable {
  const MainscreenState();

  @override
  List<Object> get props => [];
}

class MainscreenInitial extends MainscreenState {}

class MainscreenLoading extends MainscreenState {}

class MainscreenLoaded extends MainscreenState {
  final Coctails coctails;

  const MainscreenLoaded({required this.coctails});
}

class MainscreenError extends MainscreenState {}
