import 'package:flutter/material.dart';

import '../../class/allClass.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Data = [
    {
      'name': 'Zeel',
      'contact': '12345678987',
      'address': 'punagam, surat1',
      'salary': '25000',
    },
    {
      'name': 'Harshil',
      'contact': '456123789852',
      'address': 'punagam, surat2',
      'salary': '30000',
    },
    {
      'name': 'Parth',
      'contact': '8621596348',
      'address': 'punagam, surat3',
      'salary': '20000',
    },
    {
      'name': 'Akash',
      'contact': '4521456538',
      'address':
          'punagam, surat4 sdfe dfdvffv fvrfvrf fefrfvr fedazavfv fbgnjyjrsc',
      'salary': '15000',
    },
    {
      'name': 'Shubham',
      'contact': '8523699632',
      'address': 'punagam, surat5',
      'salary': '75000',
    },
    {
      'name': 'Ronak',
      'contact': '8521597536',
      'address': 'punagam, surat6',
      'salary': '50000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'AddComplaintList');
          },
          icon: Icon(Icons.ac_unit),
        ),
        title: Text(
          "Employee",
          style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.023, letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'Complaint');
          }, icon: Icon(Icons.comment)),
        ],
      ),
      body: ListView.builder(
          itemCount: Data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(left: getProportionateScreenHeight(15), right: getProportionateScreenHeight(15), top: getProportionateScreenHeight(15)),
              child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(getProportionateScreenHeight(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth * .75,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getProportionateScreenHeight(8)),
                                    child: Text(
                                      "${Data[index]['name']}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.screenHeight * 0.022, letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pushNamed(context, 'EyePage',
                                            arguments: Data[index]);
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.green,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(5),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth * .75,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getProportionateScreenHeight(8)),
                                    child: Text(
                                      "${Data[index]['contact']}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.screenHeight * 0.022, letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(5),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth * .75,
                                  // height: MediaQuery.of(context).size.height * 0.03,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getProportionateScreenHeight(8)),
                                    child: Text(
                                      "${Data[index]['address']}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.screenHeight * 0.022,
                                          letterSpacing: 1,
                                          overflow: TextOverflow.clip),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(5),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth * .75,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: getProportionateScreenHeight(8)),
                                    child: Text(
                                      "${Data[index]['salary']}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.screenHeight * 0.022, letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
