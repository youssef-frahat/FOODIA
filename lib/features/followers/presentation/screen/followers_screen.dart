import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';

import '../logic/cubit/all_followers_cubit.dart';
import '../widget/list_view_builder_cefi.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اتابعه', style: TextStyle(fontFamily: 'Changa')),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<AllFollowersCubit>()..fetchFollowers(),
        child: Column(
          children: const [
            ListViewBuilderCefi(),
            SizedBox(height: 16),
            // DottedLineRedWidget(),
            // SizedBox(height: 16),
            // ListViewFoodsBody(),
          ],
        ),
      ),
    );
  }
}
