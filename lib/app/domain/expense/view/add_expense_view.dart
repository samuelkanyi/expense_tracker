import 'dart:ffi';

import 'package:expense_tracker/app/dummy_data/data.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_cubit.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_state.dart';
import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:expense_tracker/util/colors.dart';
import 'package:expense_tracker/util/common/base_button.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddExpenseView extends CubitWidget<ExpenseCubit, ExpenseState> {
  @override
  void initState(BuildContext context, ExpenseCubit cubit) async {
    // TODO: implement initState
    super.initState(context, cubit);
    // await cubit.deleteAll();
  }

  @override
  Widget build(BuildContext context, ExpenseCubit cubit, ExpenseState state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'New Expense',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.back(),
        ),
      ),
      body: Column(
        children: [
          // Amount input section with teal background
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            color: AppColors.primary,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Amount',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '\KSH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: (value) => cubit.onAmountChanged(value),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorWidth: 1,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: '0.00',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Form section with white background
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Category dropdown
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.category!.isEmpty
                            ? categories.first
                            : state.category,
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Row(
                              children: [
                                Icon(
                                  _getCategoryIcon(category),
                                  color: _getCategoryColor(category),
                                ),
                                const SizedBox(width: 12),
                                Text(category),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) =>
                            cubit.categoryChanged(newValue!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (value) => cubit.descriptionChanged(value),
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Wallet dropdown
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.paymentMethod!.isEmpty
                            ? wallets.first
                            : state.paymentMethod,
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: wallets.map((String wallet) {
                          return DropdownMenuItem<String>(
                            value: wallet,
                            child: Row(
                              children: [
                                Icon(_getWalletIcon(wallet)),
                                const SizedBox(width: 12),
                                Text(wallet),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) =>
                            cubit.paymentMethodChanged(newValue!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Add attachment button
                  InkWell(
                    onTap: () {
                      // Implement attachment functionality
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.attach_file, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Add attachment',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Repeat transaction switch
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Repeat',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Repeat transaction',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const Spacer(),

                  // Save button
                  PrimaryButton(
                    onPressed: () async => cubit.addExpense(),
                    isLoading: state.step == ExpenseFormStateStep.progress,
                    label: 'Save',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant;
      case 'Transport':
        return Icons.directions_bus;
      case 'Entertainment':
        return Icons.movie;
      case 'Shopping':
        return Icons.shopping_bag;
      case 'Utilities':
        return Icons.power;
      default:
        return Icons.category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.orange;
      case 'Transport':
        return Colors.blue;
      case 'Entertainment':
        return Colors.purple;
      case 'Shopping':
        return Colors.pink;
      case 'Utilities':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getWalletIcon(String wallet) {
    switch (wallet) {
      case 'Cash':
        return Icons.money;
      case 'Credit Card':
        return Icons.credit_card;
      case 'Debit Card':
        return Icons.credit_card;
      case 'Savings':
        return Icons.savings;
      default:
        return Icons.account_balance_wallet;
    }
  }
}
