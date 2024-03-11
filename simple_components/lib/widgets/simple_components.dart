import 'package:flutter/material.dart';

class SimpleComponents extends StatefulWidget {
  const SimpleComponents({Key? key}) : super(key: key);

  @override
  _SimpleComponentsState createState() => _SimpleComponentsState();
}

class _SimpleComponentsState extends State<SimpleComponents> {

  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  late bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return _buildTabBar();
  }

  Widget _buildTabBar() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Components"),
              bottom: const TabBar(
//               indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home, color: Colors.white),
                    child: Text('Home',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    icon: Icon(Icons.account_balance, color: Colors.white),
                    child: Text('Account',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    icon: Icon(Icons.calculate, color: Colors.white),
                    child: Text('Payments',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    icon: Icon(Icons.credit_score, color: Colors.white),
                    child: Text('Card',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildComponents(),
                SizedBox(
                  child: Center(
                    child: Text('Account Page Tab 2'),
                  ),
                ),
                SizedBox(
                  child: Center(
                    child: Text('Payments Page Tab 3'),
                  ),
                ),
                SizedBox(
                  child: Center(
                    child: Text('Card Page Tab 4'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  Widget _buildComponents() {
    return Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #1"),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #2"),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #3"),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildDropdownMenuColor(),
              _buildDropdownMenuIcon(),
            ],
          ),
          const SizedBox(height: 10),
          _buildDisplaySelected(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Checkbox(
                  value: _isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCheck = value!;
                    });
                  }
              ),
              Checkbox(
                  value: _isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCheck = value!;
                    });
                  }
              )
            ],
          )
        ]
    );
  }
  Widget _buildDropdownMenuColor() {
    return DropdownMenu<ColorLabel>(
      initialSelection: ColorLabel.green,
      controller: colorController,
      // requestFocusOnTap is enabled/disabled by platforms when it is null.
      // On mobile platforms, this is false by default. Setting this to true will
      // trigger focus request on the text field and virtual keyboard will appear
      // afterward. On desktop platforms however, this defaults to true.
      requestFocusOnTap: true,
      label: const Text('Color'),
      onSelected: (ColorLabel? color) {
        setState(() {
          selectedColor = color;
        });
      },
      dropdownMenuEntries: ColorLabel.values
          .map<DropdownMenuEntry<ColorLabel>>(
              (ColorLabel color) {
            return DropdownMenuEntry<ColorLabel>(
              value: color,
              label: color.label,
              enabled: color.label != 'Grey',
              style: MenuItemButton.styleFrom(
                foregroundColor: color.color,
              ),
            );
          }).toList(),
    );
  }
  Widget _buildDropdownMenuIcon() {
    return DropdownMenu<IconLabel>(
      controller: iconController,
      enableFilter: true,
      requestFocusOnTap: true,
      leadingIcon: const Icon(Icons.search),
      label: const Text('Icon'),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (IconLabel? icon) {
        setState(() {
          selectedIcon = icon;
        });
      },
      dropdownMenuEntries:
      IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
            (IconLabel icon) {
          return DropdownMenuEntry<IconLabel>(
            value: icon,
            label: icon.label,
            leadingIcon: Icon(icon.icon),
          );
        },
      ).toList(),
    );
  }
  Widget _buildDisplaySelected() {
    if (selectedColor != null && selectedIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              selectedIcon?.icon,
              color: selectedColor?.color,
            ),
          )
        ],
      );
    }
    return const Text('Please select a color and an icon.');
  }

  Future<void> _buildShowDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}