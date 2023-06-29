import 'package:flutter/material.dart';

import '../../class/allClass.dart';
import 'homepage.dart';

List DateData = [];

class EyePage extends StatefulWidget {
   EyePage({Key? key}) : super(key: key);

  @override
  State<EyePage> createState() => _EyePageState();
}

class _EyePageState extends State<EyePage> {
  DateTime date = DateTime.now();
  bool changeColor = true;

  @override
  Widget build(BuildContext context) {
    dynamic detail = ModalRoute.of(context)!.settings.arguments as dynamic;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${detail['name']}",
          style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.023, letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
      ),
      body: (DateData.isNotEmpty) ?  StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...DateData.map((e) {
                return Padding(
                  padding:  EdgeInsets.all(getProportionateScreenHeight(20)),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(getProportionateScreenHeight(16)),
                      child: Row(
                        children: [
                          Text(
                            "${e['day']} / ${e['month']} / ${e['year']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.screenHeight * 0.023),
                          ),
                          Spacer(),
                          Text(
                            "${e['attendance']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.screenHeight * 0.023),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        }

      ) : Column(
                 mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "asset/images/no-data.png",
                  height: SizeConfig.screenHeight * .100,
                ),
              ),
            ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return (changeColor == true) ? GestureDetector(
                        onTap: () {
                          changeColor = false;
                          Map<String, dynamic> data = {
                            'day': date.day,
                            'month': date.month,
                            'year': date.year,
                            'attendance': "P",
                          };

                          DateData.add(data);
                          Navigator.pop(context);

                          setState(() {
                          });
                        },
                        child: Padding(
                          padding:  EdgeInsets.all(getProportionateScreenHeight(15)),
                          child: Container(
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
                              color: (changeColor) ? Colors.red : Colors.green,
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(getProportionateScreenHeight(10)),
                              child: Row(
                                children: [
                                  Text(
                                    "${date.day} / ${date.month} / ${date.year}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.screenHeight * 0.026,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  (changeColor)
                                      ? Text(
                                    "A",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.screenHeight * 0.024,
                                        color: Colors.white),
                                  )
                                      : Text(
                                    "P",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.screenHeight * 0.024,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ) : Padding(
                        padding:  EdgeInsets.all(getProportionateScreenHeight(15)),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
                            color: (changeColor) ? Colors.red : Colors.green,
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(getProportionateScreenHeight(10)),
                            child: Row(
                              children: [
                                Text(
                                  "${date.day} / ${date.month} / ${date.year}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenHeight * 0.024,
                                      color: Colors.white),
                                ),
                                Spacer(),
                                (changeColor)
                                    ? Text(
                                  "A",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenHeight * 0.024,
                                      color: Colors.white),
                                )
                                    : Text(
                                  "P",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenHeight * 0.024,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                );
              },
            );
          },
        label: Text("Attendance"),
          icon: Icon(Icons.add),
      ),
    );
  }
}
