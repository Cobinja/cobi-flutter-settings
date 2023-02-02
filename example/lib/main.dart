import 'package:cobi_flutter_settings/cobi_flutter_settings.dart';
import 'package:cobi_flutter_settings_example/types.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Example'),
      ),
      body: SettingsScreen(
        title: 'App Settings',
        children: [
          SettingsGroup(
            title: 'Switchable Settings with different header color',
            style: TextStyle(
              color: Colors.teal,
            ),
            children: [
              SwitchSetting(
                settingsKey: 'switch-setting',
                title: 'This is a switch setting',
                defaultValue: true
              ),
              CheckboxSetting(
                settingsKey: 'checkbox-setting',
                title: 'This is a checkbox setting',
                defaultValue: false,
              ),
            ],
          ),
          ImageSetting(
            settingsKey: 'image-setting',
            title: 'This is an image setting',
            showPreview: true,
          ),
          SettingsGroup(
            title: 'Text Settings',
            children: [
              TextSetting<String>(
                settingsKey: 'text-setting',
                title: 'A text setting with default keyboard type',
              ),
              TextSetting<String>(
                settingsKey: 'text-setting-2',
                title: 'This a text setting with a specified subtitle',
                subtitle: 'This is a subtitle'
              ),
              TextSetting<int>(
                settingsKey: 'text-setting-3',
                title: 'A text setting for integers only',
                keyboardType: TextInputType.number,
                defaultValue: 42000,
                validator: (value) {
                  if (value == null || value < 1024 || value > 65536) {
                    return 'Integer number between 1024 and 65536 expected';
                  }
                },
              ),
              TextSetting<double>(
                settingsKey: 'text-setting-4',
                title: 'A text setting for doubles only',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          MultiSelectSetting<String>(
            settingsKey: 'multi-select-setting',
            title: "A multi-select setting",
            items: [
              ListItem(value: "hello", caption: "Hello"),
              ListItem(value: "world", caption: "World"),
              ListItem(value: "foo", caption: "foo"),
              ListItem(value: "bar", caption: "bar"),
            ]
          ),
          RadioModalSetting<int>(
            settingsKey: 'radio-modal-setting',
            title: 'This is a modal radio setting',
            defaultValue: 5,
            items: [
              ListItem<int>(value: 1, caption: 'One'),
              ListItem<int>(value: 2, caption: 'Two'),
              ListItem<int>(value: 3, caption: 'Three'),
              ListItem<int>(value: 4, caption: 'Four'),
              ListItem<int>(value: 5, caption: 'Five'),
              ListItem<int>(value: 6, caption: 'Six'),
              ListItem<int>(value: 7, caption: 'Seven'),
              ListItem<int>(value: 8, caption: 'Eight'),
              ListItem<int>(value: 9, caption: 'Nine'),
              ListItem<int>(value: 10, caption: 'Ten'),
              ListItem<int>(value: 11, caption: 'Eleven'),
              ListItem<int>(value: 12, caption: 'Twelve'),
              ListItem<int>(value: 13, caption: 'Thirteen'),
              ListItem<int>(value: 14, caption: 'Fourteen'),
              ListItem<int>(value: 15, caption: 'Fifteen'),
              ListItem<int>(value: 16, caption: 'Sixteen'),
              ListItem<int>(value: 17, caption: 'Seventeen'),
              ListItem<int>(value: 18, caption: 'Eighteen'),
              ListItem<int>(value: 19, caption: 'Nineteen'),
              ListItem<int>(value: 20, caption: 'Twenty'),
              ListItem<int>(value: 21, caption: 'Twentyone'),
              ListItem<int>(value: 22, caption: 'Twentytwo'),
              ListItem<int>(value: 23, caption: 'Twentythree'),
            ],
          ),
          RadioSetting<int>(
            settingsKey: 'radio-setting',
            title: 'This is a radio setting',
            items: [
              ListItem<int>(value: 1, caption: 'One'),
              ListItem<int>(value: 2, caption: 'Two'),
              ListItem<int>(value: 3, caption: 'Three'),
              ListItem<int>(value: 4, caption: 'Four'),
              ListItem<int>(value: 5, caption: 'Five'),
            ]
          ),
          SliderSetting(
            settingsKey: 'slider-setting',
            title: 'This is a slider setting',
            minValue: 0.0,
            maxValue: 10.0,
            divisions: 10,
            defaultValue: 5.0,
          ),
          TestTypeSetting(
            title: "This is a settign with a custom type",
            settingsKey: "test-type-setting",
          ),
          CustomSetting(
            title: 'This is a custom setting',
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Warning'),
                content: Text('Self destruct in 5 seconds.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.pop(context)
                  ),
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context)
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
