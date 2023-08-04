import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  static const String _title = 'ቤተ';
  const Home({Key? key}):super(key:key);
  @override
  State<Home> createState() =>_HomeScreen();

}
class _HomeScreen extends State<Home>{
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0,),
                  //make border radius more than 50% of square height & width
                  child: Image.asset(
                    'assets/image/images.jpeg',
                    fit: BoxFit.contain,
                    height: 42,
                    width: 42,

                  ),
                )
                ,

                Container(
                    padding: const EdgeInsets.all(6.0), child: Text('Home'))
              ],

            ),),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Fixed: Provide a String directly as the label
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search', // Fixed: Provide a String directly as the label
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile', // Fixed: Provide a String directly as the label
              backgroundColor: Colors.brown,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.brown,
          iconSize: 35,
          onTap: _onItemTapped,
          elevation: 2,
        ),

      );
    throw UnimplementedError();
  }

}
class MyStatefulWidget extends StatefulWidget {

  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ቤተ ክህነት',
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w500,
                      fontFamily: "nano",
                      fontSize: 34),
                )),
              Container(
                alignment:Alignment.bottomCenter,
                
              )




          ],
        ));
  }
}