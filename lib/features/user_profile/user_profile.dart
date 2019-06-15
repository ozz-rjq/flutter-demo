import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserProfilePage extends StatefulWidget {
  final Map<dynamic, dynamic> personDetails;
  UserProfilePage({Key key, this.personDetails}) : super(key: key);

  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _fullName;
  String _firstName;
  String _gender;
  String _status;
  String _bio;
  String _country;
  String _age;
  String _friends;
  String _followers;
  String _scores;
  String _avatarSrc;
  bool _followed;
  bool _isIam;

  TextEditingController _textFieldController = TextEditingController();

  List<BottomNavigationBarItem> _bottomNavbarItems;
  String _bottomNavbarValue = '';
  int _bottomNavbarIndex = 0;

  List<IconData> _presents = [];

  List<Widget> _pages;

  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bottomNavbarItems = List();
    _bottomNavbarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.info_outline), title: Text('General')));
    _bottomNavbarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard), title: Text('Presents')));

    // set person properties

    _fullName = widget.personDetails['fullname'];
    _firstName = widget.personDetails['fullname'].split(' ')[0];
    _gender = widget.personDetails['gender'];
    _status = widget.personDetails['status'];
    _bio = widget.personDetails['bio'];
    _country = widget.personDetails['country'];
    _age = widget.personDetails['age'];
    _friends = widget.personDetails['friends'];
    _followers = widget.personDetails['posts'];
    _scores = widget.personDetails['scores'];
    _avatarSrc = widget.personDetails['photo'];
    _followed = widget.personDetails['followed'];
    _isIam = widget.personDetails['isIam'];
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.75,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_avatarSrc),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      color: Theme.of(context).indicatorColor,
      fontFamily: 'Roboto',
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Friends", _friends),
          _buildStatItem("Followers", _followers),
          _buildStatItem("Rating", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with $_firstName:",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  void _follow() {
    String _textToShow = '';

    if (!_followed) {
      _textToShow = 'Now you\'re following $_firstName!';
    } else {
      _textToShow = 'Unfollowed!';
    }

    _scaffoldstate.currentState.showSnackBar(new SnackBar(
        content: new Text(
      _textToShow,
      textAlign: TextAlign.center,
    )));

    setState(() {
      if (!_followed) {
        _followers = (double.parse(_followers) + 1).toString().split('.')[0];
      } else {
        _followers = (double.parse(_followers) - 1).toString().split('.')[0];
      }

      _followed = !_followed;
    });
  }

  void _message() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New message'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Say 'Hi!' to $_firstName"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('SEND'),
                onPressed: () {
                  _textFieldController.value = TextEditingValue.empty;

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: _follow,
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    _followed ? "UNFOLLOW" : "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: _message,
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(bottom: 8.0),
          color: Colors.blueGrey,
          child: Text('General Info:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
        ),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.location_city),
          ),
          Padding(
            padding: EdgeInsets.all((8.0)),
            child: Text('Country:',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),
          ),
          Text(_country,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        ]),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.public),
          ),
          Padding(
            padding: EdgeInsets.all((8.0)),
            child: Text('Age:',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),
          ),
          Text(_age,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        ]),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.person),
          ),
          Padding(
            padding: EdgeInsets.all((8.0)),
            child: Text('Gender:',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),
          ),
          Text(_gender == 'M' ? 'Male' : 'Female',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        ])
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _bottomNavbarIndex = index;
    });
  }

  Widget _buildPresents() {
    if (_isIam) {
      return Text('You don\'t have any presents!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700));
    }

    if (_presents.length == 0) {
      return Text('$_firstName still doesn\'t have any presents.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700));
    }

    return Container(
      padding: EdgeInsets.all(12.0),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: <Widget>[
          for (var p in _presents)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(p),
            )
        ],
      ),
    );
  }

  void _addPresent(IconData present) {
    setState(() {
      _presents.add(present);
    });
  }

  Future _sendCompliment() async {
    switch (await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text('Select a present:'),
          children: <Widget>[
            SimpleDialogOption(
              child: Icon(Icons.favorite),
              onPressed: () {
                Navigator.pop(context, 'favorite');
              },
            ),
            SimpleDialogOption(
              child: Icon(Icons.flash_on),
              onPressed: () {
                Navigator.pop(context, 'flash_on');
              },
            ),
            SimpleDialogOption(
              child: Icon(Icons.flight),
              onPressed: () {
                Navigator.pop(context, 'flight');
              },
            ),
            SimpleDialogOption(
              child: Icon(Icons.format_paint),
              onPressed: () {
                Navigator.pop(context, 'format_paint');
              },
            ),
            SimpleDialogOption(
              child: Icon(Icons.free_breakfast),
              onPressed: () {
                Navigator.pop(context, 'free_breakfast');
              },
            ),
          ],
        ))) {
      case 'favorite':
        _addPresent(Icons.favorite);
        break;
      case 'flash_on':
        _addPresent(Icons.flash_on);
        break;
      case 'flight':
        _addPresent(Icons.flight);
        break;
      case 'format_paint':
        _addPresent(Icons.format_paint);
        break;
      case 'free_breakfast':
        _addPresent(Icons.free_breakfast);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _definePages(screenSize);
    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
          title: _isIam
              ? Text('My Profile')
              : Text(widget.personDetails['fullname'])),
      body: _pages[_bottomNavbarIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavbarItems,
        fixedColor: Colors.blue,
        currentIndex: _bottomNavbarIndex,
        onTap: onTabTapped,
      ),
    );
  }

  _definePages(screenSize) {
    _pages = [
      Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  !_isIam ? _buildStatContainer() : Container(),
                  _buildBio(context),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  !_isIam ? _buildGetInTouch(context) : Container(),
                  SizedBox(height: 8.0),
                  !_isIam ? _buildButtons() : Container(),
                  _buildAdditionalInfo()
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
          color: Color.fromRGBO(22, 5, 222, 0.1),
          width: double.infinity,
          height: double.infinity,
          child: Column(children: <Widget>[
            Padding(padding: EdgeInsets.all(12.0), child: _buildPresents()),
            // condition
            !_isIam
                ? OutlineButton(
                    child: Text('Send Compliment'.toUpperCase()),
                    onPressed: _sendCompliment,
                  )
                : Container()
          ]))
    ];
  }
}
