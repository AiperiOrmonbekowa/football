import 'package:flutter/material.dart';
import 'package:football/constants/static/app_colors.dart';
import 'package:football/constants/static/app_text_style.dart';
import 'package:gap/gap.dart';

class CashGame extends StatelessWidget {
  const CashGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet,
            color: AppColors.green,
          ),
          Gap(3),
          Text(
            'Cash Game',
            style: AppTextStyle.cashGameDetail,
          ),
        ],
      ),
    );
  }
}
