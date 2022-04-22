import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logindemo/app/user/application/facade.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../domain/params/login_params.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._userFacade) : super(LoginInitial()) {
    on<LoginEvent>(_handler);
  }

  final UserFacade _userFacade;

  static const emailControllerName = 'email';
  static const passwordControllerName = 'password';

  final FormGroup form = FormGroup(
    {
      emailControllerName: FormControl(
        validators: [
          Validators.compose([
            Validators.email,
            Validators.required,
          ])
        ],
      ),
      passwordControllerName: FormControl(
        validators: [Validators.required],
      ),
    },
  );

  FutureOr<void> _handler(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginSubmitted) {
      await _mapSubmitted(emit);
    } else if (event is LoginCanceled) {
      _mapLoginCanceled();
    }
  }

  void _mapLoginCanceled() {}

  Future<void> _mapSubmitted(Emitter<LoginState> emit) async {
    if (form.valid) {
      emit(LoginLoading());
      form.unfocus();
      final result = await _userFacade.login(LoginParams.fromMap(form.value));
      result.when(
        success: (data) => emit(LoginSuccess()),
        failure: (message) => emit(LoginFailure(message)),
      );
    } else {
      form.markAllAsTouched();
    }
  }
}
