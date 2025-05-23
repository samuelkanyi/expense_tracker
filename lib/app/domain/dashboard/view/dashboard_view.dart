import 'package:expense_tracker/app/domain/dashboard/cubit/cubit/dashboard_cubit.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_cubit.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_state.dart';
import 'package:expense_tracker/app/domain/income/cubit/income_cubit.dart';
import 'package:expense_tracker/app/dummy_data/data.dart';
import 'package:expense_tracker/app/routing/router_names.dart';
import 'package:expense_tracker/util/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ExpenseDashboard extends StatefulWidget {
  const ExpenseDashboard({super.key});

  @override
  State<ExpenseDashboard> createState() => _ExpenseDashboardState();
}

class _ExpenseDashboardState extends State<ExpenseDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with user greeting and profile
                    _buildHeader(),
                    const SizedBox(height: 24),

                    // Card with account balance and summary
                    _buildBalanceCard(state),
                    const SizedBox(height: 24),

                    // Monthly spending chart
                    _buildMonthlyChart(),
                    const SizedBox(height: 30),

                    // Category spending section
                    _buildCategorySection(state),
                    const SizedBox(height: 30),

                    // Recent transactions
                    _buildRecentTransactions(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouterNames.addExpense),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Amshel',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Your Finances',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.push(RouterNames.settings),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(DashboardState state) {
    final data = state as Loaded;
    final balance = data.income - data.expenses;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.tertiary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ksh $balance',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBalanceItem(
                icon: Icons.arrow_upward,
                title: 'Income',
                amount: 'ksh ${data.income}',
                positive: true,
              ),
              _buildBalanceItem(
                icon: Icons.arrow_downward,
                title: 'Expenses',
                amount: 'ksh ${data.expenses}',
                positive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem({
    required IconData icon,
    required String title,
    required String amount,
    required bool positive,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthlyChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Monthly Spending',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                      if (value >= 0 && value < months.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            months[value.toInt()],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 5,
              minY: 1000,
              maxY: 2000,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    for (int i = 0; i < monthlyData.length; i++)
                      FlSpot(i.toDouble(), monthlyData[i]),
                  ],
                  isCurved: true,
                  color: Theme.of(context).colorScheme.primary,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(DashboardState state) {
    final data = state as Loaded;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Spending Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: data.categoryTotals.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> category = data.categoryTotals[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _getCategoryColor(category['name'].toString())
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _getCategoryIcon(category['name'].toString()),
                          size: 16,
                          color: _getCategoryColor(category['name'].toString()),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'ksh ${category['amount']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    category['name'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentTransactions(DashboardState state) {
    final data = state as Loaded;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.transactions.length,
          separatorBuilder: (context, index) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final transaction = data.transactions[index];
            return Row(
              children: [
                // Category icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _getCategoryColor(transaction.category)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    _getCategoryIcon(transaction.category),
                    color: _getCategoryColor(transaction.category),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                // Transaction details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${transaction.category} • ${DateFormat.MMMd().format(transaction.createdAt as DateTime)}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Amount
                Text(
                  '- ksh${transaction.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

Color _getCategoryColor(String category) {
  return switch (category) {
    'Food' => const Color(0xFF6C63FF),
    'Transport' => const Color(0xFF4ECDC4),
    'Entertainment' => const Color(0xFFFF6584),
    'Utilities' => const Color(0xFFFFAA33),
    _ => const Color(0xFF4ECDC4)
  };
}

IconData _getCategoryIcon(String category) {
  return switch (category) {
    'Food' => FontAwesomeIcons.utensils,
    'Transport' => FontAwesomeIcons.bus,
    'Entertainment' => FontAwesomeIcons.film,
    'Utilities' => FontAwesomeIcons.bolt,
    _ => FontAwesomeIcons.atom
  };
}
