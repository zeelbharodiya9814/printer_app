import 'package:flutter/material.dart';




class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}



// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}


class AddComplaintList extends StatefulWidget {
  const AddComplaintList({super.key});



  @override
  State<AddComplaintList> createState() => _AddComplaintListState();
}

class _AddComplaintListState extends State<AddComplaintList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Complaint",
          style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.025, letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.only(left: getProportionateScreenHeight(10), right: getProportionateScreenHeight(10), top: getProportionateScreenHeight(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: getProportionateScreenHeight(9),right: getProportionateScreenHeight(9),bottom: getProportionateScreenHeight(9),top: getProportionateScreenHeight(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: SizeConfig.screenHeight * .15,
                            width: SizeConfig.screenWidth * .30,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(getProportionateScreenHeight(11)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(9),
                      ),
                      Container(
                        width:SizeConfig.screenWidth * .55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:SizeConfig.screenWidth * .45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Printer Name : $index",
                                        style: TextStyle(fontSize: SizeConfig.screenHeight * 0.023,letterSpacing: 1,color: Colors.black,fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text("Image : $index"),
                                              );
                                            });
                                      });
                                    },
                                    child: Icon(Icons.remove_red_eye,color: Colors.green,)),
                              ],
                            ),
                            Text(
                              "Address : $index",
                              style: TextStyle(fontSize: SizeConfig.screenHeight * 0.023,letterSpacing: 1,color: Colors.black,fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Description : $index",
                              style: TextStyle(fontSize: SizeConfig.screenHeight * 0.023,letterSpacing: 1,color: Colors.grey),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
