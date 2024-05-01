part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeEmpty extends HomeState {}

final class PesananTerbaru extends HomeState {
  final List<Property> propertys;
  // final Property property;

  const PesananTerbaru({required this.propertys});

  @override
  List<Object> get props => [propertys];
}
