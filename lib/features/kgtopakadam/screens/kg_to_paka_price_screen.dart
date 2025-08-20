
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
  double extraKg = 0.0;
  double totalPrice = 0.0;
  double perkgprice = 0.0;

  void calculate() {
    double totalRice = double.tryParse(totalRiceController.text) ?? 0; // মোট কেজি
    double monWeight = double.tryParse(monWeightController.text) ?? 0; // প্রতি মণ কত কেজি
    double pricePerMon = double.tryParse(pricePerMonController.text) ?? 0; // প্রতি মণের দাম

    if (monWeight == 0) return; // শূন্য ভাগ এড়াতে

    double mon = totalRice / monWeight; // ভগ্নাংশ সহ মোট মণ
    int monInt = mon.floor(); // পূর্ণ মণ
    double fractionalPart = mon - monInt; // ভগ্নাংশ অংশ
    double kgEquivalent = fractionalPart * 40; // ভগ্নাংশ অংশকে ৪০ দিয়ে গুণ

    double pricePerKg = pricePerMon / monWeight;
    double price = (monInt * pricePerMon) + (kgEquivalent * pricePerKg);

    setState(() {
      totalMon = mon;
      fullMon = monInt;
      extraKg = kgEquivalent;
      totalPrice = price;
      perkgprice = pricePerKg;
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
                      Text('মোট: ${fullMon} মন ${extraKg.toStringAsFixed(2)} কেজি',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('প্রতি কেজির দাম: ${perkgprice.toStringAsFixed(2)} টাকা',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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