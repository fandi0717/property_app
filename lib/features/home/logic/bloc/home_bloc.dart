import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/features/home/data/repositories/pesananan_repository.dart';

import '../../data/models/property.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeEmpty()) {
    final PesananPropertyRepository repository = PesananPropertyRepository();

    on<EksplorPropertyEvent>(
        (event, emit) => eksplorPropertyFunc(event, emit, repository));

    on<Back2EmptyPropertyEvent>(
        (event, emit) => back2EmptyProperty(event, emit));

    on<SwitchPropertyEvent>((event, emit) => switchProperty(event, emit));
  }

  eksplorPropertyFunc(EksplorPropertyEvent event, Emitter<HomeState> emit,
      PesananPropertyRepository repository) {
    List<Property> results = repository.getAllProperty();
    emit(PropertyOrder(propertys: results, index: event.index));
  }

  back2EmptyProperty(Back2EmptyPropertyEvent event, Emitter<HomeState> emit) {
    emit(HomeEmpty());
  }

  switchProperty(SwitchPropertyEvent event, Emitter<HomeState> emit) {
    emit(PropertyOrder(propertys: event.propertys, index: event.index));
  }
}
