// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(ProductInformationApp());

class ProductInformationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Information',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: ProductInformationScreen(),
    );
  }
}

class ProductInformationScreen extends StatefulWidget {
  @override
  State<ProductInformationScreen> createState() =>
      _ProductInformationScreenState();
}

class _ProductInformationScreenState extends State<ProductInformationScreen> {
  // final List<String> images = [
  //   'assets/images/download.jpeg',
  //   'assets/images/download (1).jpeg',
  //   'assets/images/download (2).jpeg',
  // ];

  List imageList = [
    {"id": 1, "image_path": 'assets/images/download.jpeg'},
    {"id": 2, "image_path": 'assets/images/download (1).jpeg'},
    {"id": 3, "image_path": 'assets/images/download (2).jpeg'}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text('Honda Activa 110cc'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            // width: double.infinity,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: false,
                      // aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Expanded(
            //     child: CarouselSlider(
            //       items: images.map((item) => Image.asset(item)).toList(),
            //       options: CarouselOptions(
            //         height: 200.0, viewportFraction: 1,
            //         // aspectRatio: 0.6,
            //         enableInfiniteScroll: true,
            //         autoPlay: true,
            //       ),
            //     ),
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Honda Activa 110cc",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.star,
                      color: Colors.blue.shade800,
                    ),
                    Text(
                      "4.3",
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "(44 riders)",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "MH 12 KP 3431",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green.shade700,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 2),
                  backgroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                  maximumSize: Size(160, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Vehicle Preview",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 0.6,
                  child: LiteRollingSwitch(
                    value: true,
                    textOn: "On",
                    textOff: "Off",
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.redAccent,
                    iconOn: Icons.done,
                    iconOff: Icons.cancel,
                    onTap: () => {},
                    width: 100,
                    textSize: 15,
                    onDoubleTap: (bool postion) => {},
                    onSwipe: (bool postion) => {},
                    onChanged: (bool postion) => {},
                    animationDuration: Duration(
                      milliseconds: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Accpeting Rides",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Divider(color: Colors.grey, height: 5, thickness: 3),
            Expanded(
              child: Column(
                // shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee),
                          SizedBox(width: 15),
                          Text("Pricing"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 15),
                          Text("Pickup Location"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 15),
                          Text("Vehicle Photos"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.menu),
                          SizedBox(width: 15),
                          Text("Vehicle Description"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 15),
                          Text("Set Availability"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.note_alt_outlined),
                          SizedBox(width: 15),
                          Text("Notes for pickup"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
