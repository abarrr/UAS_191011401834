import 'package:akbarzain_191011401834_uas/bloc/posts_bloc.dart';
import 'package:akbarzain_191011401834_uas/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:akbarzain_191011401834_uas/bloc/posts_bloc.dart';
import 'package:bloc/bloc.dart';
import 'bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsBloc>(
        create: (context) => PostsBloc()..add(LoadEvent()),
        child: PostsView(),
      ),
    );
  }
}
