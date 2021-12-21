import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_arch_and_mobx/feature/post/view_model/post_view_model.dart';

class PostView extends StatelessWidget {
  PostView({Key? key}) : super(key: key);

  late final _postViewModel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX and MVVM'),
      ),
      body: Observer(builder: (_) {
        return _stateStatus();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _postViewModel.getAllPost(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _stateStatus() {
    switch (_postViewModel.viewState) {
      case ViewState.normal:
        return const SizedBox();
      case ViewState.loading:
        return const Center(child: CircularProgressIndicator());
      case ViewState.success:
        return _buildListView();
      case ViewState.error:
        return const Center(
          child: Text('Error'),
        );
      default:
        return const Center(
          child: Text('Error'),
        );
    }
  }

  ListView _buildListView() {
    return ListView.separated(
      itemCount: _postViewModel.posts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ListTile(
        title: Text(_postViewModel.posts[index].title),
        subtitle: Text(_postViewModel.posts[index].body),
        trailing: Text(_postViewModel.posts[index].userId.toString()),
      ),
    );
  }
}
