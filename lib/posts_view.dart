import 'package:akbarzain_191011401834_uas/bloc/posts_bloc.dart';
import 'package:akbarzain_191011401834_uas/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Akbar Zain - 191011401834 - UAS'),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return ListView.builder(
                itemCount: state.Posts.length,
                itemBuilder: (context, index) {
                  Post posts = state.Posts[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(posts.id.toString()),
                      ),
                      title: Text(posts.title, maxLines: 1),
                      subtitle: Text(posts.body, maxLines: 1),
                    ),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
