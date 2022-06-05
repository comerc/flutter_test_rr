import 'package:flutter/material.dart';
import 'package:flutter_test_rr/import.dart';

enum HomeScreenViewMode { list, grid }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isStateCode = false;
  bool isStateOrProvince = false;
  HomeScreenViewMode viewMode = HomeScreenViewMode.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 25,
                            minHeight: 25,
                          ),
                          hintText: 'Search',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ),
                  PopupMenuButton(
                    offset: Offset(0, 25),
                    constraints: const BoxConstraints.tightFor(),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      CustomPopupMenuItem(
                        child: FilterMenuItem(
                          initialValue: isStateCode,
                          onChanged: (bool value) {
                            isStateCode = value;
                          },
                          title: Text('State Code'),
                        ),
                      ),
                      CustomPopupMenuItem(
                        child: FilterMenuItem(
                          initialValue: isStateOrProvince,
                          onChanged: (bool value) {
                            isStateOrProvince = value;
                          },
                          title: Text('State Or Province'),
                        ),
                      ),
                    ],
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
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    onPressed: () {
                      if (viewMode == HomeScreenViewMode.list) {
                        return;
                      }
                      setState(() {
                        viewMode = HomeScreenViewMode.list;
                      });
                    },
                    icon: Icon(Icons.list_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      if (viewMode == HomeScreenViewMode.grid) {
                        return;
                      }
                      setState(() {
                        viewMode = HomeScreenViewMode.grid;
                      });
                    },
                    icon: Icon(Icons.grid_view_rounded),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(child: _buildView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildView() {
    final viewModes = {
      HomeScreenViewMode.list: _buildListView,
      HomeScreenViewMode.grid: _buildGridView,
    };
    assert(viewModes.length == HomeScreenViewMode.values.length);
    return viewModes[viewMode]!();
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: _buildCard,
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: titles.length,
      itemBuilder: _buildCard,
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Icon(icons[index]),
        title: Text(titles[index]),
        subtitle: Text('subtitle #$index'),
        dense: viewMode == HomeScreenViewMode.list,
      ),
    );
  }
}
