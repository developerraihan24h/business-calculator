import 'package:flutter/material.dart';

import '../../common/uihelper.dart';

class PakaKgToPriceScreen extends StatefulWidget {
  @override
  _PakaKgToPriceScreenState createState() => _PakaKgToPriceScreenState();
}

class _PakaKgToPriceScreenState extends State<PakaKgToPriceScreen> {
  final TextEditingController monController = TextEditingController();
  final TextEditingController kgController = TextEditingController();
  final TextEditingController monWeightController = TextEditingController(
    text: '38',
  );
  final TextEditingController pricePerMonController = TextEditingController();

  double totalPrice = 0.0;

  void calculatePrice() {
    int mon = int.tryParse(monController.text) ?? 0;
    double kg = double.tryParse(kgController.text) ?? 0;
    double monWeight = double.tryParse(monWeightController.text) ?? 0;
    double pricePerMon = double.tryParse(pricePerMonController.text) ?? 0;

    // কেজিতে রূপান্তর
    double totalKg = (mon * monWeight) + kg;

    // কেজি অনুযায়ী দাম
    double pricePerKg = pricePerMon / monWeight;

    // মোট টাকা
    double total = totalKg * pricePerKg;

    setState(() {
      totalPrice = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('মন ও কেজি থেকে দামের হিসাব', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: uiHelper.customTextFormField(controller: monController, text: "মোট কত মন", toHide: false,keyboardType:  TextInputType.number),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: uiHelper.customTextFormField(controller: kgController, text: "অতিরিক্ত কেজি", toHide: false,keyboardType:  TextInputType.number),
                ),
              ],
            ),
            SizedBox(height: 16),
           uiHelper.customTextFormField(controller: monWeightController, text: "১ মন = কত কেজি", toHide: false,keyboardType:  TextInputType.number),
            SizedBox(height: 16),
            uiHelper.customTextFormField(controller: pricePerMonController, text: "প্রতি মনের দাম (৳)", toHide: false,keyboardType:  TextInputType.number),


            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculatePrice,
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

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'মোট দাম: ৳${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
