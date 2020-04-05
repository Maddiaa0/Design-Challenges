import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //for the bottom App bar
  int selectedIndex = 0;


  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F7),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_made,
                  color: selectedIndex == 1
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: selectedIndex == 2
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 3
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        //color of the BottomAppBar
        color: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(), //TODO: update behaviour
      body: SizedBox.expand(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("My Diary",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back_ios)),
                      Icon(Icons.calendar_today, size: 16, ),
                      Text("15th May",),
                      IconButton(icon: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ],
              ),



            ),
            SectionHeading(
              heading: "Mediterrainian Diet",
              onTap: (){

              },
              trailingText: "Details",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 280,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              DietThingRow(title: "Eaten", kalCount: 1127, icon: Icons.calendar_today,),
                              SizedBox(height: 20,),
                              DietThingRow(title: "Burned", kalCount: 102, icon: Icons.file_upload, barColour: Colors.orange,),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 140.0,
                            lineWidth: 14.0,
                            animation: true,
                            percent: 0.7,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "1503",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                Text(
                                  "kal left",
                                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                                )
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.blue
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Padding(
                        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FoodTypeTracker(
                              type: "Carbs",
                              trackerColour: Colors.blue,
                              trackerProgress: 60,
                              howMuchLeft: "12g left",
                            ),
                            FoodTypeTracker(
                              type: "Protein",
                              trackerColour: Colors.orange,
                              trackerProgress: 20,
                              howMuchLeft: "30g left"
                            ),
                            FoodTypeTracker(
                              type: "Fat",
                              trackerProgress: 10,
                              trackerColour: Colors.yellow,
                              howMuchLeft: "10g left",
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              )
            ),
            SectionHeading(
              heading: "Meals Today",
              onTap: (){

              },
              trailingText: "Customise",
            ),
            SizedBox(
              height: 200,
              child: ListView(
                //TODO: switch this to a builder with a seperator for build
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 24,),
                  SwipingMealCard(
                    heading: "Breakfast",
                    colour: Colors.orange,
                    item1: "Bread,",
                    item2: "Peanut butter,",
                    item3: "Apple,",
                    kcalCount: "535 kcal",
                  ),
                  SizedBox(width: 12),
                  SwipingMealCard(
                    heading: "Lumch",
                    colour: Colors.blue,
                    item1: "Salmon,",
                    item2: "Mixed veggies",
                    item3: "Avocado",
                    kcalCount: "602 kcal"
                  ),
                  SizedBox(width: 12),
                  SwipingMealCard(
                    heading: "Snack",
                    colour: Colors.redAccent,
                    kcalCount: "*800 kcal",
                  )
                ]
              ),
            ),
            SectionHeading(
              heading: "Body Measurement",
              onTap: (){

              },
              trailingText: "Today",
            )
          ]
        ),
      )
    );
  }
}

TextStyle titleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);


class DietThingRow extends StatelessWidget {

  DietThingRow({this.title, this.kalCount, this.icon, this.barColour = Colors.grey});

  final String title;
  final int kalCount;
  final IconData icon;
  final Color barColour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(height: 50, width: 4, decoration: BoxDecoration(
          color: barColour,
          borderRadius: BorderRadius.all(Radius.circular(2))
        ),),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.grey),),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(icon),
                Text("$kalCount kal", style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        )
      ],
    );
  }
}

class HorizontalProgressBar extends StatelessWidget {

  HorizontalProgressBar({this.percentageComplete, this.colour});

  final int percentageComplete;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 5,
        width: 60,
        child:
        Row(
          children: <Widget>[
            Expanded(
                flex: percentageComplete,
                child: Container(color: colour,)
            ),
            Expanded(
                flex: 100-percentageComplete,
                child: Container(color: Colors.grey)
            )
          ],
        )
    );
  }
}

class FoodTypeTracker extends StatelessWidget {

  FoodTypeTracker({this.type, this.trackerColour, this.trackerProgress, this.howMuchLeft});

  final String type;
  final Color trackerColour;
  final int trackerProgress;
  final String howMuchLeft;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(type,
          style: TextStyle(
              fontSize: 16,
              fontWeight:
              FontWeight.w600
          )
        ),
        SizedBox(height: 3,),
        HorizontalProgressBar(
            colour: trackerColour,
            percentageComplete: trackerProgress),
        SizedBox(height: 10,),
        Text(
          howMuchLeft,
          style: TextStyle(
            color: Colors.grey
          )
          ,)
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {

  SectionHeading({this.heading, this.onTap, this.trailingText});

  final String heading;
  final Function onTap;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(heading, style: titleTextStyle),
            GestureDetector(
              onTap: onTap,
                //TODO: implement on tap behaviour,
              child: Row(
                children: <Widget>[
                  Text(trailingText),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward),
                ],
              ),
            )
          ],
        )
    );
  }
}

class SwipingMealCard extends StatelessWidget {

  SwipingMealCard({
    this.colour,
    this.heading,
    this.kcalCount,
    this.item1 = "",
    this.item2 = "",
    this.item3 = ""
  });

  final Color colour;
  final String heading;
  final String kcalCount;
  final String item1;
  final String item2;
  final String item3;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.colour,
      elevation: 5,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
      ),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal:20),
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Text(this.heading, style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 20),
              Text(this.item1, style: TextStyle(color: Colors.white),),
              Text(this.item2,style: TextStyle(color: Colors.white),),
              Text(this.item3,style: TextStyle(color: Colors.white),),
              SizedBox(height: 40),
              Text(this.kcalCount,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),)
            ],
          )
      ),
    );
  }
}




