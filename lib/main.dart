import 'package:flutter/material.dart';
import 'package:flutter_mvvm_arch_and_mobx/feature/post/view/post_view.dart';

void main() => runApp(const MobXAndMVVM());

class MobXAndMVVM extends StatelessWidget {
  const MobXAndMVVM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX and MVVM',
      debugShowCheckedModeBanner: false,
      home: PostView(),
    );
  }
}
