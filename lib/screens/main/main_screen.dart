import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/main/main_provider.dart';
import 'package:weather_app/screens/forecast/forecast_screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> widgets = [
    HomeScreen(),
    SearchScreen(),
    ForecastScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Scaffold(
      appBar: AppBar(

      ),
      body: widgets[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          provider.changeInadex(index);
        },
        currentIndex: provider.currentIndex,
        iconSize: 28,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), label: 'Forecast'),
          ],
      ),
    );
  }
}
