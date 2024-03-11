import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
    this.onChanged,
    this.onFilter,
    required this.controller,
  });
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFilter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                hintText: "Search Food",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .grey[300]!),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 22,
                  color: Colors.black,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              print('Filter');
              onFilter!(controller!.text);
            },
            child: Container(
              width: 48.00,
              height: 48.00,
              decoration: BoxDecoration(
                color: Colors.amber[400],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(
                Icons.filter_list,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
