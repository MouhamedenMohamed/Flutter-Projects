import 'package:flutter/material.dart';
class CustomInputField extends StatelessWidget {
  final String label, hint;
  final bool hasIcon;
  final Icon icon;
  const CustomInputField({
    Key key,
    this.label,
    this.hint,
    this.hasIcon,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
              ),
              hasIcon
                  ? IconButton(
                      icon: icon,
                      onPressed: () {},
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}