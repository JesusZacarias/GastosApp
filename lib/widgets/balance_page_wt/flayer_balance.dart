import 'package:exp_app/providers/expenses_provider.dart';
import 'package:exp_app/utils/math_operations.dart';
import 'package:exp_app/widgets/balance_page_wt/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlayerBalance extends StatelessWidget {
  const FlayerBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final eList = context.watch<ExpensesProvider>().eList;
    final entList = context.watch<ExpensesProvider>().enList;
    double totalExp = 0;
    double totalEnt = 0;
    double total = 0;

    totalExp = getSumOfExp(eList);
    totalEnt = getSumOfEntrie(entList);
    total = totalEnt - totalExp;
    
    return  Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(
                  vertical: -4,
                ),
                title: const Text('Ingresos'),
                trailing: Text(
                  getAmountFormat(totalEnt),
                  style: const TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(
                  vertical: -4,
                ),
                title: const Text('Gastos'),
                trailing: Text(
                  getAmountFormat(totalExp),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                thickness: 2.0,
              ),
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(
                  vertical: -4,
                ),
                title: const Text('Total'),
                trailing: Text(
                  getBalance(eList, entList),
                  style: TextStyle(color: (total < 0) ? Colors.red : Colors.green),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 200.0,
            child: ChartBar(),
          ),
        ),
      ],
    );
  }
}
