import 'package:design/design.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logindemo/service_locator/service_locator.dart';

import 'package:reactive_forms/reactive_forms.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const path = '/login';
  static const name = 'login_screen';

  static final handler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl(),
      child: const LoginScreen(),
    );
  });

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginBloc = context.read<LoginBloc>();
    return Theme(
      data: theme.copyWith(
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: theme.textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          body: ReactiveForm(
            formGroup: loginBloc.form,
            child: SingleChildScrollView(
              child: RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const RSizedBox.vertical(64),
                    const YouText.displaySmall(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    const RSizedBox.vertical(8),
                    const YouText.bodySmall(
                      'Please login to your account',
                    ),
                    KeyboardVisibilityBuilder(
                      closed: () => const RSizedBox.vertical(64),
                      open: () => const RSizedBox.vertical(16),
                    ),
                    CustomReactiveTextField(
                      hintText: 'Enter a email',
                      prefix: Icons.email_outlined,
                      validationMessages: (control) => {
                        ValidationMessage.email: 'Enter a valid email!',
                        ValidationMessage.required: 'Required',
                      },
                      formControlName: LoginBloc.emailControllerName,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const RSizedBox.vertical(16),
                    CustomReactiveTextField(
                      obscureText: true,
                      hintText: 'Enter a password',
                      prefix: Icons.lock_outlined,
                      formControlName: LoginBloc.passwordControllerName,
                      validationMessages: (control) => {
                        ValidationMessage.email: 'Enter a valid email!',
                        ValidationMessage.required: 'Required',
                      },
                    ),
                    KeyboardVisibilityBuilder(
                      closed: () => const RSizedBox.vertical(64),
                      open: () => const RSizedBox.vertical(16),
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          onPressed: () {
                            _onLoginPressed(context);
                          },
                          child: const Text('Login'),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text('Forgot password?',
                            style: TextStyle(color: Colors.black)),
                        style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: EdgeInsets.zero),
                        onPressed: () {},
                      ),
                    ),
                    const RSizedBox.vertical(32),
                    const Align(
                      alignment: Alignment.center,
                      child: YouText.labelSmall('or login with'),
                    ),
                    const RSizedBox.vertical(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.google,
                        ),
                        const RSizedBox.horizontal(32),
                        CustomIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.facebookF,
                        ),
                        const RSizedBox.horizontal(32),
                        CustomIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.twitter,
                        ),
                      ],
                    ),
                    const RSizedBox.vertical(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const YouText.bodyMedium(
                          'Don\' have an account? ',
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: const Text(
                            'Create new now!',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const YouText.bodyMedium(
                          'By signing up you agree to our ',
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: const Text(
                            'Terms and conditions',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginFailure) {
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: PColors.primarySwatch.shade300,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
