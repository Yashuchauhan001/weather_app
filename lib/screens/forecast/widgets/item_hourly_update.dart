import 'package:flutter/material.dart';
import 'package:weather_app/data/models/hours_model.dart';

class ItemHourlyUpdate extends StatelessWidget {
  final HoursModel hour;
  const ItemHourlyUpdate({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Image.network(hour.condition?.icon?.replaceFirst('//', 'https://')?? ''),
          Text('${hour.tempC}C'),
          Text(hour.time?? '', style: Theme.of(context).textTheme.bodySmall,)
        ],
      ),
    );
  }
}
