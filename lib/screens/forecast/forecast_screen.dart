import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecast/forecast_provider.dart';
import 'package:weather_app/screens/forecast/widgets/item_forecast_day.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(
        builder: (context, provider, child){
          return provider.loading? Center(child: CircularProgressIndicator()):
          ListView(
            children: [
              for(var day in provider.forecastdays)
                ItemForecastDay(forecastday: day)
            ],
          );
        }
    );
  }
}
