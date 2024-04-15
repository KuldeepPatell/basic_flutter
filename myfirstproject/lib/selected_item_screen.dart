import 'package:flutter/material.dart';
import 'package:myfirstproject/image_slider.dart';

import 'package:myfirstproject/itemSlider.dart';

class SelectedItemScreen extends StatefulWidget {
  SelectedItemScreen({super.key});
  @override
  State<SelectedItemScreen> createState() => _SelectedItemScreen();
}

class _SelectedItemScreen extends State<SelectedItemScreen> {
  final List imageList = [
    {"id": 1, "image_path": 'assets/images/slider1_image.webp'},
    {"id": 2, "image_path": 'assets/images/slider2_image.webp'},
    {"id": 3, "image_path": 'assets/images/slider3_image.webp'},
    {"id": 4, "image_path": 'assets/images/slider2_image.webp'},
  ];
  String color = 'Khaki';
  var _size = 0.4;

  final List<CartItem> cartItems = [
    CartItem(
        image: 'assets/images/sht.jpg',
        name: 'Forever18',
        description: 'Short Sleeve Top',
        price: 50.00,
        icons: Icons.favorite_outline_sharp),
    CartItem(
      image: 'assets/images/sht2.jpg',
      name: 'Jean Short',
      description: 'Leather Jacket',
      price: 80.00,
      icons: Icons.favorite_border,
    ),
    CartItem(
      image: 'assets/images/sht1.jpg',
      name: 'Forever18',
      description: 'Short White Tee',
      price: 50.00,
      icons: Icons.favorite_border,
    ),
    CartItem(
      image: 'assets/images/sofa.jpg',
      name: 'Fashion Label',
      description: 'Long Dress ',
      price: 70.00,
      icons: Icons.favorite_border,
    ),
  ];

  var arrImage = [
    'assets/images/listimage1.jpg',
    'assets/images/listimage2.jpg',
  ];
  var arrItem = ['Long Sleeve Top', 'White Shirt'];
  var arrItemPrize = ['\$50.00', '\$50.00'];
  var arrsubtitle = ['Subtitle goes here', 'Size S'];
  var arrItemCount = [1, 1];
  bottomSheet() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        height: 800,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${arrImage.length} items",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Divider(),
            ),
            Container(
              width: double.maxFinite,
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(arrImage[index])),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  arrItem[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  arrItemPrize[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  arrsubtitle[index],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  size: 16.5,
                                )),
                            Text(
                              '${arrItemCount[index]}',
                              style: TextStyle(
                                  fontSize: 16.5, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 16.5,
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                }),
                itemCount: arrImage.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Divider(
                thickness: 2,
                color: Colors.black,
                height: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total amount',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 14, right: 14),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    )
                  ]),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 70, 62),
                      shape: BeveledRectangleBorder(),
                    ),
                    onPressed: () {},
                    child: const Text('Check out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() {
          _size = 0.4;
        }),
        child: child,
      );
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              height: 90,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add to bag ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _size = 0.4;
                            });

                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return bottomSheet();
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        body: Stack(children: [
          Stack(children: [
            ImageSlider(imageLists: imageList),
            Positioned(
                top: 30,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                )),
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )),
          ]),
          makeDismissible(
            child: DraggableScrollableSheet(
                initialChildSize: _size,
                minChildSize: 0.4,
                maxChildSize: 0.9,
                snapSizes: [0.4, 0.9],
                snap: true,
                builder: (_, controller) => ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: ListView(controller: controller, children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _size = 0.9;
                                });
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Elegant Long Sleeve\nSwing Top",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Column(children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.share_outlined,
                                          size: 30,
                                        ),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 30,
                                        ),
                                        onTap: () {},
                                      ),
                                    ]),
                                  ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$288.00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: screenWidth,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Color: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        ' $color',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: screenWidth * .45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.circle,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              color = 'Grey';
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.circle,
                                            color: Color.fromARGB(
                                                255, 163, 184, 194),
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              color = 'Light blue';
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.circle,
                                            color: Color.fromARGB(
                                                255, 204, 187, 126),
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              color = 'Khaki';
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.circle,
                                            color: Color.fromARGB(
                                                255, 141, 91, 107),
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              color = 'Pink';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "This is a beautiful women Swing Top for your",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "daily look,it is elegance meets...",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    'More',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'Shiping and returns',
                                style: TextStyle(fontSize: 17),
                              ),
                              onTap: () {},
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'Details and care',
                                style: TextStyle(fontSize: 17),
                              ),
                              onTap: () {},
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'You might also like',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                "12 items",
                                style: TextStyle(fontSize: 13),
                              ),
                              onTap: () {},
                            ),
                            Container(
                              width: double.infinity,
                              height: 320,
                              color: Colors.amber,
                              child: RowCarts(cartItems: cartItems),
                            ),
                          ]),
                        ]),
                      ),
                    )),
          )
        ]));
  }
}
