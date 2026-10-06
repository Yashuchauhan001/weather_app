import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/search_model.dart';
import 'package:weather_app/providers/wearther/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  final SearchModel1 item;
  const WeatherScreen({super.key, required this.item});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    context.read<WeatherProvider>().getCurrentWeather(widget.item.name?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Consumer<WeatherProvider>(
        builder: (context, provider, child){
          return Scaffold(
            appBar: AppBar(),
            body: provider.loading? Center(child: CircularProgressIndicator()):
            Column(
              children: [
                ListTile(
                  title: Text('Name'),
                  trailing: Text(provider.location?.name?? ''),
                ),
                ListTile(
                  title: Text('Region'),
                  trailing: Text(provider.location?.region?? ''),
                ),
                ListTile(
                  title: Text('Country'),
                  trailing: Text(provider.location?.country?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Temperature (c)'),
                  trailing: Text(provider.current?.tempC.toString()??  ''),
                ),
                ListTile(
                  title: Text('Condition'),
                  trailing: Text(provider.current?.condition?.text??  ''),
                  leading: Image.network(
                    provider.current?.condition?.icon?.replaceFirst('//', 'https://') ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.cloud);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Wind Speed (Kph)'),
                  trailing: Text(provider.current?.windKph.toString()??  ''),
                ),
                ListTile(
                  title: Text('Cloud'),
                  trailing: Text(provider.current?.cloud.toString()??  ''),
                ),
              ],
            ),
          );

        }
    );
  }
}
