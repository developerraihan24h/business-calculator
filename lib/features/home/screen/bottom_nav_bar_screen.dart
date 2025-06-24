import 'package:flutter/material.dart';
import 'package:pakahisabcalculator/features/calculator/screens/calculator_screen.dart';
import 'package:pakahisabcalculator/features/kgtopakadam/screens/kg_to_paka_price_screen.dart';
import 'package:pakahisabcalculator/features/pakakgtodam/screens/paka_kg_to_price_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    KgToPakaPriceScreen(),
    PakaKgToPriceScreen(),
    CalculatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),


      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.green.shade50,
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
              }
              return const TextStyle(color: Colors.black);
            }),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(color: Colors.green);
              }
              return const IconThemeData(color: Colors.black);
            }),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.calculate_outlined),
              label: 'কেজি থেকে মন',
            ),
            NavigationDestination(
              icon: Icon(Icons.calculate_rounded),
              label: 'মন থেকে দাম',
            ),
            NavigationDestination(
              icon: Icon(Icons.calculate),
              label: 'ক্যালকুলেটর',
            ),
          ],
        ),
      ),



    );
  }
}
