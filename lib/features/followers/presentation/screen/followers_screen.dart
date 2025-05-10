import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';

import '../../../../core/witgets/dotted_line_red_widget.dart';
import '../logic/cubit/all_followers_cubit.dart';
import '../widget/list_view_builder_cefi.dart';
import '../widget/list_view_foods_body.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اتابعه', style: TextStyle(fontFamily: 'Changa')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create:
                  (context) => getIt<AllFollowersCubit>()..getAllFollowersChefe(),
              child: ListViewBuilderCefi(),
            ),
            DottedLineRedWidget(),
            BlocProvider(
              create: (context) => getIt<AllFollowersCubit>()..getFoodsChefe(),
              child: ListViewFoodsBody(),
            ),
          ],
        ),
      ),
    );
  }
}
