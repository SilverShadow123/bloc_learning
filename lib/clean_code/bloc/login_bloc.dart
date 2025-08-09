import 'package:bloc/bloc.dart';
import 'package:bloc_learning/clean_code/repository/auth/login_repository.dart';
import 'package:bloc_learning/clean_code/utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
  void _onLoginApi(LoginApi event, Emitter<LoginState> emit) async{
    Map data = {
      'email': state.email,
      'password': state.password,
    };

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

   await loginRepository.loginApi(data).then((value){
    if(value.error.isNotEmpty){
      emit(state.copyWith(message: value.error.toString(), postApiStatus: PostApiStatus.error));

    }else{
      emit(state.copyWith(message: value.token, postApiStatus: PostApiStatus.success));
    }
    }).onError((error, stackTrace){
      emit(state.copyWith(message: error.toString(), postApiStatus: PostApiStatus.error));
   });


  }

}
