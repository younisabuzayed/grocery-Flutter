import 'package:flutter/material.dart';

class HeaderAccount extends StatelessWidget {
  final String username;
  final String email;
  const HeaderAccount({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Hi,",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(width: 10),
              Text("My Name",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Text(
            email,
            style:const TextStyle(
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
