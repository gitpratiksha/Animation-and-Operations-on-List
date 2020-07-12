import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  int selectIndex = -1;

  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
  ];

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    CurvedAnimation _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = new Tween(begin: 0.0, end: 1.1).animate(_curvedAnimation);
  }

  onTapDelete() {
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TranslationAnimatedWidget.tween(
        enabled: true,
        duration: Duration(milliseconds: 800),
        translationDisabled: Offset(0, 1000),
        translationEnabled: Offset(0, 0),
        child: Container(
          color: Colors.pinkAccent,
          child: ListView.builder(
            itemCount: europeanCountries.length,
            itemBuilder: (context, index) {
              //final item = items[index];
              final item = europeanCountries[index];
              print(item);
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() {
                    europeanCountries.removeAt(index);
                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("swipe to delete")));
                },
                background: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  color: Colors.red[100],
                  child: Icon(Icons.cancel),
                ),
                secondaryBackground: Container(
                  color: Colors.red[100],
                  child: Icon(
                    Icons.delete,
                  ),
                ),
                child: ListTile(
                  title: Text(europeanCountries[index]),
                  trailing: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        setState(() {
                          europeanCountries.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
