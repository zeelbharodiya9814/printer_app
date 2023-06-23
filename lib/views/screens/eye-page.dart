import 'package:flutter/material.dart';

import 'homepage.dart';


List DateData = [];


class EyePage extends StatefulWidget {
  const EyePage({Key? key}) : super(key: key);

  @override
  State<EyePage> createState() => _EyePageState();
}

class _EyePageState extends State<EyePage> {

  DateTime date = DateTime.now();
  bool changeColor = true;

  @override
  Widget build(BuildContext context) {

    dynamic detail = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${detail['name']}",
          style: TextStyle(
              fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'DateList', arguments: DateData);
          }, icon: Icon(Icons.list_alt))
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                changeColor = false;

                Map<String, dynamic> data = {
                  'day' : date.day,
                  'month' : date.month,
                  'year' : date.year,
                  'attendance' : "P",
                };

                DateData.add(data);
                // Navigator.pushNamed(context, 'ListPage')
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: (changeColor) ? Colors.red : Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("${date.day} / ${date.month} / ${date.year}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.white),),
                  Spacer(),
                  (changeColor) ? Text("A",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.white),) : Text("P",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
