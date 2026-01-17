import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/post_repository.dart';
import 'package:weather/logic/bloc/api_bloc.dart';
import 'package:weather/presentation/screens/home_screen.dart';

void main() async {
  PostRepository postRepository = PostRepository();
  postRepository.fetchPost();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepository(),
      child: BlocProvider(
        create: (context) => ApiBloc(context.read<PostRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
