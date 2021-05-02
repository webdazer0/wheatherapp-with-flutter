import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/cities/add/add_city_bloc.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/common/loader_widget.dart';
import 'package:wheatherapp/ui/ui_constants.dart';

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final bloc = AddCityBloc();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bloc,
      builder: (context, child) {
        return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      HeaderWidget(
                        title: 'Aggiungere Città',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: TextField(
                          onChanged: bloc.onChangedText,
                          decoration: InputDecoration(
                            hintText: 'Cerca città',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: bloc.cities.length,
                          itemBuilder: (context, index) {
                            print(bloc.cities.length);
                            final city = bloc.cities[index];
                            return ListTile(
                              title: Text(
                                city.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: primaryColor,
                                ),
                                onPressed: () => bloc.addCity(city),
                              ),
                            );
                          },
                        ),
                      ),
                      if (bloc.loading)
                        Center(
                          child: LoaderWidget(),
                        ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
