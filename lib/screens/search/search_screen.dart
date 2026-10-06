import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search/search_provider.dart';
import 'package:weather_app/screens/weather/weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: EdgeInsets.all(15),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        hintText: 'search',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(search.text.isNotEmpty) {
                        provider.SearchRegion(search.text);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue
                      ),
                      child: Icon(Icons.search, color: Colors.white,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              provider.loading? Center(child: CircularProgressIndicator()): SizedBox(),
              for (var item in provider.items)
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WeatherScreen(item: item)
                    ));
                  },
                  title: Text(item.name?? ''),
                  subtitle: Text('${item.region} (${item.country})'),
                )
            ],
          );
        }
    );
  }
}
