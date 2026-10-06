import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecastday_model.dart';
import 'package:weather_app/screens/forecast/widgets/item_hourly_update.dart';


class ItemForecastDay extends StatelessWidget {
  final ForecastdayModel forecastday;
  const ItemForecastDay({super.key, required this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ListTile(
            title: Text('Date'),
            trailing: Text(forecastday.date?? ''),
          ),
          ListTile(
            title: Text('Condition'),
            trailing: Text(forecastday.day?.condition?.text?? ''),
            leading: Image.network(
              forecastday.day?.condition?.icon?.replaceFirst('//', 'https://')?? ''
            ),
          ),
          ListTile(
            title: Text('Max temperature (c)'),
            trailing: Text(forecastday.day?.maxtempC.toString()?? ''),
          ),
          ListTile(
            title: Text('Min temperature (c)'),
            trailing: Text(forecastday.day?.mintempC.toString()?? ''),
          ),
          ListTile(
            title: Text('Sunset'),
            trailing: Text(forecastday.astro?.sunset?? ''),
          ),
          ListTile(
            title: Text('Sunrise'),
            trailing: Text(forecastday.astro?.sunrise?? ''),
          ),
          Divider(),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for(var hour in forecastday.hour?? [])
                  ItemHourlyUpdate(hour: hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}
