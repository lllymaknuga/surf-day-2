import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/blocs/auth_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: _AppBar(),
      ),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const _LoadingWidget(),
              if (index != 9)
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
            ],
          );
        },
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
        children: [
          const Expanded(
            child: Text('Чаты'),
          ),
          IconButton(
            onPressed: () =>
                context.read<AuthBloc>().add(const LogOutAuthEvent()),
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const _ChatAvatar(),
      title: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 15,
        width: double.infinity,
      ),
      subtitle: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 15,
        width: double.infinity,
      ),
    );
  }
}

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Material(
        color: Colors.grey,
        shape: CircleBorder(),
      ),
    );
  }
}
