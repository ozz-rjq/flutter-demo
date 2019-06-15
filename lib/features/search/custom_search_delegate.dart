import 'package:flutter/material.dart';

import './../user_profile/user_profile.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Map<String, dynamic>> people;

  CustomSearchDelegate(this.people);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if (theme.brightness == Brightness.dark) {
      return theme;
    }

    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget _buildLeading(item) {
    return CircleAvatar(
      backgroundImage: AssetImage(item['photo']),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Type at least 3 symbols",
            ),
          )
        ],
      );
    }

    Widget result = _getResult(context);

    return result;
  }

  @override
  Widget buildResults(BuildContext context) {
    Widget result = _getResult(context);

    return result;
  }

  Widget _getResult(context) {
    List<Map<String, dynamic>> filteredPeople = people.where((person) {
      return person['fullname'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    Widget result;

    if (filteredPeople.length > 0) {
      result = ListView(
        children: <Widget>[
          for (var person in filteredPeople)
            ListTile(
              leading: _buildLeading(person),
              trailing: Text('${person['age']} y.o.'),
              title: Text('${person['fullname']}'),
              onTap: () {
                Navigator.push<bool>(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return UserProfilePage(
                    personDetails: person,
                  );
                }));
              },
              isThreeLine: true,
              subtitle: Text('${person['country']}'),
            ),
        ],
      );
    } else {
      result = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "No results for your query",
            ),
          )
        ],
      );
    }

    return result;
  }
}
