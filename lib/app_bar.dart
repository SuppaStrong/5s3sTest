import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
    required this.style,
  }) : super(key: key);

  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(66, 86, 85, 1),
      leading: Container(
          color: const Color.fromRGBO(8, 163, 160, 1),
          child: IconButton(
            icon: const Icon(
              Icons.dehaze,
              size: 40,
            ),
            onPressed: () {},
          )),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.store),
          const SizedBox(
            width: 16,
          ),
          RichText(
            text: const TextSpan(
                text: "Store: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'Food Store',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  )
                ]),
          ),
          const SizedBox(
            width: 16,
          ),
          RichText(
            text: const TextSpan(
                text: "Register: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'Register 1',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  )
                ]),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
          const SizedBox(
            width: 12,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.zoom_out_map)),
          const SizedBox(
            width: 12,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_box,
              )),
          const SizedBox(
            width: 12,
          ),
          const Text("Test Test"),
          const SizedBox(
            width: 32,
          ),
        ],
      ),
      actions: <Widget>[
        Container(
          color: Colors.red,
          child: TextButton(
            style: style,
            onPressed: () {},
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.exit_to_app), Text("LOGOUT")],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
