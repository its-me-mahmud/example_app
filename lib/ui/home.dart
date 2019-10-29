import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> _checkedSubjects = [];
  List<bool> _checkedHobies = [];
  List<String> _subjects = ['Physics', 'Chemistry', 'Biology'];
  List<String> _hobies = ['Reading', 'Playing', 'Coding'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Subjects',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _subjects.length,
              itemBuilder: (BuildContext context, int index) {
                final subjects = _subjects[index];
                for (var i = 0; i < subjects.length; i++) {
                  if (_checkedSubjects.length < subjects.length) {
                    _checkedSubjects.add(false);
                  }
                }
                return _subjectsCheckbox(subjects, index);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hobies',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _hobies.length,
              itemBuilder: (BuildContext context, int index) {
                final hobies = _hobies[index];
                for (var i = 0; i < hobies.length; i++) {
                  if (_checkedHobies.length < hobies.length) {
                    _checkedHobies.add(false);
                  }
                }
                return _hobiesCheckbox(hobies, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _subjectsCheckbox(subjects, index) {
    return CheckboxListTile(
      value: _checkedSubjects[index],
      title: Text(subjects),
      onChanged: (bool value) {
        setState(() {
          _checkedSubjects[index] = value;
        });
      },
    );
  }

  Widget _hobiesCheckbox(hobies, index) {
    return CheckboxListTile(
      value: _checkedHobies[index],
      title: Text(hobies),
      onChanged: (bool value) {
        setState(() {
          _checkedHobies[index] = value;
        });
      },
    );
  }
}
