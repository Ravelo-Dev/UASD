import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/debts_viewmodel.dart';

class DebtsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final debtsViewModel = Provider.of<DebtsViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Deuda - UASD'),
      ),
      body: debtsViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : debtsViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(debtsViewModel.errorMessage))
              : ListView.builder(
                  itemCount: debtsViewModel.debtssList.length,
                  itemBuilder: (context, index) {
                    final debts = debtsViewModel.debtssList[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      debts.monto.toStringAsFixed(
                                          2), // Formateado a dos decimales
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    SizedBox(height: 5),
                                    Text(debts.fechaActualizacion,
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
