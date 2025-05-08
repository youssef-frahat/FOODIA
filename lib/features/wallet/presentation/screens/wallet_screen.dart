import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/spacing.dart';
import '../logic/cubit/get_balance_cubit.dart';
import '../widget/balance_card_widget.dart';
import '../widget/button_add_balance.dart';
import '../widget/transaction_item_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'المحفظة',
          style: TextStyle(fontFamily: 'Changa', fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<GetBalanceCubit>()..getBalance(),
        child: BlocBuilder<GetBalanceCubit, GetBalanceState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is GetBalanceLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetBalanceFailure) {
              return Center(child: Text(state.failure.message));
            } else if (state is GetBalanceSuccess) {
              final balance = state.getWalletModel;
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    BalanceCardWidget(amount: balance.data?.balance?.amount ?? '' ),
                    verticalSpace(30),
                    ButtonAddBalance(),
                    verticalSpace(25),
                    Text(
                      'اخر معاملاتي النقدية',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Changa',
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(15),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: balance.data?.wallets?.length ?? 0,
                        itemBuilder: (context, index) {
                          String formattedDate = _formatDate(balance.data?.wallets?[index].createdAt);
                          return TransactionItemWidget(
                            amount: balance.data?.wallets?[index].amount ?? '',
                            date: formattedDate,
                            transactionType: balance.data?.wallets?[index].type ?? '',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
  String _formatDate(Object? rawDate) {
    try {
      if (rawDate is String) {
        return rawDate; 
      } else if (rawDate is DateTime) {
        return DateFormat('d/MM/yyyy').format(rawDate);
      } else {
        return 'غير محدد'; 
      }
    } catch (e) {
      return 'غير محدد';
    }
  }
}

