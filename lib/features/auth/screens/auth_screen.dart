import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  final IAuthRepository authRepository;

  const AuthScreen({
    required this.authRepository,
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(46, 46, 46, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: _AppBar(),
        ),
        body: _Screen(),
      ),
    );
  }
}

class _Screen extends StatefulWidget {
  const _Screen({Key? key}) : super(key: key);

  @override
  State<_Screen> createState() => _ScreenState();
}

class _ScreenState extends State<_Screen> {
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    _controllerLogin.text = 'lllymaknuga';
    _controllerPassword.text = 'SbXAySLHARlr';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Авторизация',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Логин',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _controllerLogin,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(33, 33, 33, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Введите url',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Пароль',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _controllerPassword,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(33, 33, 33, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Введите url',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LoginAuthEvent(
                  login: _controllerLogin.text,
                  password: _controllerPassword.text));
            },
            child: const Text('Войти'),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
      title: Row(
        children: const [
          Expanded(
            child: Text('Surf summer jum'),
          ),
        ],
      ),
    );
  }
}
