import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health/screenroute.dart';
import 'package:health/homescreen/aboutnabh.dart';
import 'package:health/homescreen/dashboard.dart';
import 'package:health/homescreen/user.dart';
import 'package:health/homescreen/config.dart';
import 'package:health/homescreen/social.dart';
import 'package:health/homescreen/refer.dart';
import 'package:health/homescreen/policies.dart';
import 'package:health/homescreen/master.dart';
import 'package:health/loginscreen/main_logincardscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../color_picker.dart';
import '../../theme_changer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = List();

  GlobalKey _tileTargetKey = GlobalKey();
  GlobalKey _settingTargetKey = GlobalKey();
  var _homeScaffoldKey = new GlobalKey<ScaffoldState>();
  bool tutorial;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.getBool('tutorial') ?? true) {
        initTargets();
        WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
        setState(() {
          tutorial = true;
        });
      } else {
        setState(() {
          tutorial = false;
        });
      }
    });
    super.initState();
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        identify: "Tile",
        keyTarget: _tileTargetKey,
        contents: [
          ContentTarget(
            align: AlignContent.bottom,
            child: InkWell(
              onTap: () {
                tutorialCoachMark.next();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Click on the Tiles to Navigate",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.Circle,
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Setting",
        keyTarget: _settingTargetKey,
        contents: [
          ContentTarget(
            align: AlignContent.bottom,
            child: InkWell(
              onTap: () {
                tutorialCoachMark.finish();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.Circle,
      ),
    );
  }

  void _afterLayout(_) {
    Future.delayed(const Duration(seconds: 1), () {
      showTutorial();
    });
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.black,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
    )..show();
  }

  _endDrawerUI() {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/drawer_header_background.png'))),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Dark Mode"),
                trailing: Switch(
                  value: _themeChanger.isDarkTheme,
                  onChanged: (value) {
                    _themeChanger.toggleDarkTheme();
                  },
                ),
                onTap: () {
                  _themeChanger.toggleDarkTheme();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.color_lens,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Theme"),
                onTap: () {
                  Navigator.pop(context);
                  _colorPicker(_themeChanger);
                },
              ),
              ListTile(
                leading: Transform.rotate(
                    angle: pi,
                    child: Icon(
                      Icons.exit_to_app,
                      color: Theme.of(context).accentColor,
                    )),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, HomeScreenRoute(LoginCardScreen()));

                  //_confirmLogout();
                },
              ),
              ListTile(
                title: Text("Tutorial"),
                trailing: Switch(
                  value: tutorial,
                  onChanged: (value) {
                    setState(() {
                      tutorial = !tutorial;
                      SharedPreferences.getInstance().then((value) {
                        value.setBool('tutorial', tutorial);
                      });
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    tutorial = !tutorial;
                    SharedPreferences.getInstance().then((value) {
                      value.setBool('tutorial', tutorial);
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _colorPicker(_themeChanger) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a color'),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: Theme.of(context).primaryColor,
                  onColorChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('theme', value.toString());
                    print(prefs.getString('theme'));
                    _themeChanger.baseColorbyColor = value;
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _homeScaffoldKey,
      endDrawer: _endDrawerUI(),
      body: SafeArea(
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            
            TweenAnimationBuilder(
              tween: Tween(begin: 1.0, end: 0.0),
              curve: Curves.easeOutCubic,
              duration: const Duration(seconds: 1),
              child: SizedBox(
                width: width,
                height: height * 0.3,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0, -50),
                          child: Row(children: [
                            ClipOval(
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/logo.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Rooster Healthcare",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ]),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Transform.rotate(
                                key: _settingTargetKey,
                                angle: 30 * pi / 180,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      _homeScaffoldKey.currentState
                                          .openEndDrawer();
                                    }),
                              )),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Colors.red,
                  ),
                ),
              ),
              builder: (context, value, child) => Transform.translate(
                offset: Offset(0, -(height * 0.4) * (value)),
                child: child,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: <Widget>[                        
                        Dashboard(
                          key: _tileTargetKey,
                        ),
                        Aboutus(),                        
                        Userdata(),
                        Config(),
                        Social(),                        
                        Refer(),
                        Master(),
                        Policies(),                        
                      ],
                    ),
                  ),
                ),
                builder: (context, value, child) => Transform.translate(
                    offset: Offset(0, height * (value)), child: child),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

