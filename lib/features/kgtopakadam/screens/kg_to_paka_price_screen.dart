
import 'package:flutter/material.dart';
import 'package:pakahisabcalculator/features/common/uihelper.dart';

class KgToPakaPriceScreen extends StatefulWidget {
  @override
  _KgToPakaPriceScreenState createState() => _KgToPakaPriceScreenState();
}

class _KgToPakaPriceScreenState extends State<KgToPakaPriceScreen> {
  final TextEditingController totalRiceController = TextEditingController();
  final TextEditingController monWeightController = TextEditingController();
  final TextEditingController pricePerMonController = TextEditingController();

  double totalMon = 0.0;
  int fullMon = 0;
  double remainingKg = 0.0;
  double totalPrice = 0.0;

  void calculate() {
    double totalRice = double.tryParse(totalRiceController.text) ?? 0;
    double monWeight = double.tryParse(monWeightController.text) ?? 0;
    double pricePerMon = double.tryParse(pricePerMonController.text) ?? 0;

    double mon = totalRice / monWeight;
    int monInt = mon.floor();
    double remaining = totalRice - (monInt * monWeight);
    double pricePerKg = pricePerMon / monWeight;
    double price = (monInt * pricePerMon) + (remaining * pricePerKg);

    setState(() {
      totalMon = mon;
      fullMon = monInt;
      remainingKg = remaining;
      totalPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('পাকা ও দামের হিসাব', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
        
              uiHelper.customTextFormField(controller: totalRiceController, text: "মোট কত কেজি", toHide: false,keyboardType:  TextInputType.number),
              SizedBox(height: 16),
              uiHelper.customTextFormField(controller: monWeightController, text: "১ মন = কত কেজি", toHide: false,keyboardType:  TextInputType.number),
              SizedBox(height: 16),
              uiHelper.customTextFormField(controller: pricePerMonController, text: "প্রতি মনের দাম (৳)", toHide: false,keyboardType:  TextInputType.number),
              
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16), // optional: height
                  ),
                  child: const Text(
                    'হিসাব করুন',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              Text('ফলাফল:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Card(
                elevation: 2,
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('মোট: ${fullMon} মন ${remainingKg.toStringAsFixed(2)} কেজি',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('মোট দাম: ৳${totalPrice.toStringAsFixed(2)}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}