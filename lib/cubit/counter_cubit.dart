import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increment(){
    print('Before increment: $state');
    emit(state + 1);
    print('After increment: $state');
  }


}