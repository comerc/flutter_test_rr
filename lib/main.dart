import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final titles = [
  'bike',
  'boat',
  'bus',
  'car',
  'railway',
  'run',
  'subway',
  'transit',
  'walk',
  'bike',
  'boat',
  'bus',
  'car',
  'railway',
  'run',
  'subway',
  'transit',
  'walk'
];

final icons = [
  Icons.directions_bike,
  Icons.directions_boat,
  Icons.directions_bus,
  Icons.directions_car,
  Icons.directions_railway,
  Icons.directions_run,
  Icons.directions_subway,
  Icons.directions_transit,
  Icons.directions_walk,
  Icons.directions_bike,
  Icons.directions_boat,
  Icons.directions_bus,
  Icons.directions_car,
  Icons.directions_railway,
  Icons.directions_run,
  Icons.directions_subway,
  Icons.directions_transit,
  Icons.directions_walk,
];

// TODO: все методы начинаются глаголами

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _myGridView(),
      // body: _myListView(),
      body: Column(
        children: [
          // Positioned(child: child)
          // Padding(
          //   child: Text('1111'),
          //   padding: EdgeInsets.symmetric(vertical: 8.0),
          // ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // cursorHeight: 2,
                  // strutStyle: StrutStyle(forceStrutHeight: true),
                  style: TextStyle(
                    // fontSize: 40.0,
                    height: 1.4,
                    // color: Colors.black
                  ),
                  decoration: InputDecoration(
                      // border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide()
                      // ),
                      // prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      // contentPadding: EdgeInsets.zero,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
                ),
              ),
              PopupMenuButton(
                child: IgnorePointer(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt_rounded),
                    label: Text('Filter'),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                itemBuilder: (BuildContext context) {
                  final result = <PopupMenuEntry>[];
                  result.add(
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.black87),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                  );
                  result.add(
                    PopupMenuItem(
                      value: 'claim',
                      child: Row(
                        children: [
                          Icon(Icons.flag, color: Colors.black87),
                          SizedBox(width: 8),
                          Text('Claim'),
                        ],
                      ),
                    ),
                  );
                  return result;
                },
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.grid_view_rounded),
              ),
            ],
          ),
          Expanded(child: _myGridView()),
        ],
      ),
    );
  }

  Widget _myListView() {
    return ListView.builder(
      // shrinkWrap: true,
      itemCount: titles.length,
      itemBuilder: _myCard,
    );
  }

  Widget _myGridView() {
    return GridView.builder(
      // shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: titles.length,
      itemBuilder: _myCard,
    );
  }

  Widget _myCard(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Icon(icons[index]),
        title: Text(titles[index]),
        subtitle: Text('subtitle #$index'),
      ),
    );
  }
}
