import 'package:flutter/material.dart';

class CreationPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final creationHeaderTitleStyle = TextStyle(
      fontSize: 22.0,
      color: Color(0xAA000000),
      fontWeight: FontWeight.w800,
    );
    final creationHeaderSubTitleStyle = TextStyle(
      fontSize: 16.0,
      color: Color(0x88000000),
      fontWeight: FontWeight.w400,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Création",
                style: creationHeaderTitleStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                "Tapez pour ajouter",
                style: creationHeaderSubTitleStyle,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
