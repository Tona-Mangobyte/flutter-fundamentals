import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: Column(
        children: <Widget>[
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
        ]
      ),
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