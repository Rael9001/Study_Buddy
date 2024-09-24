import 'package:flutter/material.dart';
import 'package:studdy_buddy/features/timer.dart';
import 'package:studdy_buddy/features/to_do.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  // ignore: unused_field
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final Size size = constraints.biggest;
            return Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/appbar.png',
                  fit: BoxFit.cover,
                )),
              ],
            );
          }),
          actions: [
            IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/menu.png',
                    height: 80,
                    width: 80,
                    cacheHeight: 100,
                    
                  ),
                ),
                onPressed: () {
                  _showMenu(context);
                })
          ],
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.fill,
            )),
          ),
        ]));
  }
}

void _showMenu(BuildContext context) async {
  await showMenu<int>(
    context: context,
    position: RelativeRect.fromLTRB(0, 0, 0, 100),
    items: [
      PopupMenuItem<int>(
        value: 0,
        child: Row(
          children: [
            IconButton(
              icon: ClipOval(
                child: Image.asset(
                  'assets/timer.png',
                  height: 80,
                  width: 80,
                  cacheHeight: 100,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomTimer()),
                );
              },
            )
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Row(
          children: [
            IconButton(
              icon: ClipOval(
                child: Image.asset(
                  'assets/todo.png',
                  height: 80,
                  width: 80,
                  cacheHeight: 100,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TodoListScreen()),
                );
              },
            )
          ],
        ),
      ),
    ],
  );
}
