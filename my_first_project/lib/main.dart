import 'package:flutter/material.dart';

// import 'package:my_first_project/splashScreen.dart';
// import 'package:my_first_project/userHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(
        title: 'Hello',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // for List View And   List Tile
  var arrNames = ['Name', 'Name', 'Name', 'Name', 'Name', 'Name'];
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.black,
        )

        /*
            // User Input

            Center(
          child: Container(
            width: 250,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Your E-mail...',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    )),
              ),
              Container(
                height: 3,
              ),
              TextField(
                controller: passText,
                obscureText: show,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Your Paswword....',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (show == true) {
                              show = false;
                            } else {
                              show = true;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ))),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              userHomePage(emailText.text.toString()),
                        ));
                    String uEmail = emailText.text.toString();
                    String uPass = passText.text;
                    print('Email: $uEmail, Password: $uPass');
                  },
                  child: Text('Login'))
            ]),
          ),
        )
        */

        /*
            //          List Tile  And   Circle Avatar Or

            ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/cnt.jpg'),
                backgroundColor: Colors.white,
              ),
              title: Text(arrNames[index]),
              subtitle: Text('Mobile Number'),
              trailing: Icon(Icons.add),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 20,
              thickness: 1,
            );
          },
          itemCount: arrNames.length,
        )

        */

        /*  
        //                      ListView.builder
        ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  arrNames[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            );
          },
          itemCount: arrNames.length,
          itemExtent: 100,
        )
      */

        /*
        //                    List View seperated   
        ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  arrNames[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            );
          },
          itemCount: arrNames.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: 100,
              thickness: 2,
            );
          },
        )

        */

        /*    //               ScrollView

            Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(   

                //      Right to left scrolling
                padding: const EdgeInsets.only(bottom: 11),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      height: 200,
                      width: 200,
                      color: Colors.greenAccent,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      height: 200,
                      width: 200,
                      color: Colors.redAccent,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: Colors.greenAccent,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                color: Colors.blue,
              ),
            ]),
          ),
        )

        */

        /*    //       InkWell  //
         Center(
          child: InkWell(
            onTap: () {
              print('tapped on container');
            },
            onDoubleTap: () {
              print('double tapped on container');
            },
            onLongPress: () {
              print('long pressed on container');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Center(
                child: InkWell(
                  onTap: () {
                    print('Text widget tapped');
                  },
                  child: Text(
                    'Click Here',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        )
        */

        /*     // ############   ROW  AND COLUMN   ############ 


             Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'A',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'B',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'C',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'D',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'E',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            )
            */

        /*    // #########     IMAGE ##########

              Center(
          child: Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/download.jpg')),
        )
        */

        );
  }
}
