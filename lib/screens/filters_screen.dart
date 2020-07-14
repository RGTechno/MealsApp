import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget buildSwitchListTile(
    String title,
    bool currentValue,
    Function updateFilter,
    String description,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateFilter,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.filters["gluten"];
    _lactoseFree = widget.filters["lactose"];
    _vegan = widget.filters["vegan"];
    _vegetarian = widget.filters["vegetarian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              "Filter Your MEALS",
              style: TextStyle(
                fontFamily: "MontserratSemiBold",
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-Free",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  "Only gluten free meals",
                ),
                buildSwitchListTile(
                  "Lactose-Free",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  "Only lactose free meals",
                ),
                buildSwitchListTile(
                  "Vegan",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  "Only vegan meals",
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  "Only vegetarian meals",
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text("Apply Changes"),
            elevation: 10,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(10),
            hoverColor: Theme.of(context).primaryColor,
            onPressed: () {
              final selectedFilter = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
    );
  }
}
