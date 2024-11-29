import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, this.appTitle, this.actions, this.icon, this.route});
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final String? appTitle;
  final List<Widget>? actions;
  final FaIcon? icon;
  final String? route;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      //if icon is not set,return null
      leading: widget.icon != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //  color: Config.primarycolor,
              ),
              child: IconButton(
                onPressed: () {
                  //if route is given then the icon button will navigate to that route
                  if (widget.route != null) {
                    Navigator.pushNamed(context, widget.route!);
                  } else {
                    //just simply pop back to previous page
                    Navigator.of(context).pop();
                  }
                },
                icon: widget.icon!,
                iconSize: 16,
                color: Colors.black,
              ))
          : null,
      //if action is not set,return null
      actions: widget.actions ?? null,
    );
  }
}
