import 'package:bloc_learning/bloc/posts/posts_bloc.dart';
import 'package:bloc_learning/bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/posts/posts_event.dart';
import '../../utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PostBloc>().add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search with email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(
                          SearchItem(searchText: filterKey),
                        );
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            state.tempostList.isEmpty
                                ? state.postList.length
                                : state.tempostList.length,
                        itemBuilder: (context, index) {
                          if (state.tempostList.isNotEmpty) {
                            final post = state.tempostList[index];
                            return ListTile(
                              title: Text(post.name.toString()),
                              subtitle: Text(post.body.toString()),
                              leading: Text(post.id.toString()),
                              trailing: Text(post.email.toString()),
                            );
                          } else {
                            final post = state.postList[index];
                            return ListTile(
                              title: Text(post.name.toString()),
                              subtitle: Text(post.body.toString()),
                              leading: Text(post.id.toString()),
                              trailing: Text(post.email.toString()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            case PostStatus.failure:
              return Center(child: Text('Error: ${state.message}'));
          }
        },
      ),
    );
  }
}
