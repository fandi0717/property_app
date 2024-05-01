part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class EksplorPropertyEvent extends HomeEvent {
  final int index;

  const EksplorPropertyEvent({this.index = 0});

  @override
  List<Object> get props => [index];
}

final class Back2EmptyPropertyEvent extends HomeEvent {}

// final class SwitchPropertyEvent extends HomeEvent {}
