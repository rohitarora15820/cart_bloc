import 'package:flutter/material.dart';

class AppDetailDialog extends StatefulWidget {
  const AppDetailDialog({super.key});

  @override
  State<AppDetailDialog> createState() => _AppDetailDialogState();
}

class _AppDetailDialogState extends State<AppDetailDialog> {

  final TextEditingController itemCodeController=TextEditingController();
    final TextEditingController amountController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column
          (
          children: [
            TextFormField(
              controller: itemCodeController,
            decoration: InputDecoration(
              label: Text("Enter Item Code")
        
            ),
            ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text("Enter Amount")
        
            ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Add Item"))
          ],
          ),
        ),
      ),

    );
  }
}