import 'package:flutter/material.dart';

class MonthScreenDetails extends StatelessWidget {

  const MonthScreenDetails(this.itemTitle);

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    const title = 'Details Page';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 338.0,
                width: 800.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(itemTitle),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}