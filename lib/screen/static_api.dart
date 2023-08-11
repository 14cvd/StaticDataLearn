import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/model/model.dart';
import 'package:flutter_api/widget/appbar_widget.dart';

import '../widget/divider_widget.dart';

// ignore: must_be_immutable
class StaticAPI extends StatefulWidget {
  const StaticAPI({super.key});

  @override
  State<StaticAPI> createState() => _StaticAPIState();
}

class _StaticAPIState extends State<StaticAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        titleName: "Static Json",
      ),
      body: FutureBuilder(
        future: fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var item = snapshot.data;

            return ListView.separated(
                itemBuilder: (context, index) {
                  var data = item[index];

                  return Card(
                    color: index % 2 == 0 ? Colors.white : Colors.blueGrey[200],
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: index % 2 != 0
                              ? Colors.white
                              : Colors.blueGrey[200],
                          child: Text(
                            data.id.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        title: Text(
                          "Email : ${data.email}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        ),
                        subtitle: ExpansionTile(
                          title: Text("Name : ${data.name}"),
                          children: <Widget>[
                            Card(
                              child: Text(data.body.toString()),
                            )
                          ],
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const CustomDivider();
                },
                itemCount: item!.length);
          } else if (snapshot.hasError) {
            return const Center(child: Text("Eroor Response"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ModelJson>?> fetchItems() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");

    var jsonData = jsonDecode(response);

    if (jsonData is List) {
      return jsonData.map((e) => ModelJson.fromJson(e)).toList();
    }
    return null;
  }
}
