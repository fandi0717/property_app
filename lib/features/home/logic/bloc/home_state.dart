part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeEmpty extends HomeState {}

final class PropertyOrder extends HomeState {
  final List<Property> propertys;
  // final Property property;
  final int index;

  const PropertyOrder({required this.propertys, this.index = 0});

  @override
  List<Object> get props => [propertys, index];
}
