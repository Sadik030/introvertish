import 'package:flutter/material.dart';

class SupervisionCard extends StatefulWidget {
  const SupervisionCard({super.key});

  @override
  State<SupervisionCard> createState() => _SupervisionCardState();
}

class _SupervisionCardState extends State<SupervisionCard> {
  String selectedValue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Column(
              children: [Text("Daughter"), Text("+1 999992323")],
            ),
            IconButton(
              icon: Icon(Icons.menu), // You can customize this icon
              onPressed: () {
                _showDropdownMenu(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) {
    // Get the position of the icon
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset iconPosition = renderBox.localToGlobal(Offset.zero);

    // Show the dropdown menu directly below the icon
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        iconPosition.dx,
        iconPosition.dy + kToolbarHeight,
        iconPosition.dx + renderBox.size.width,
        iconPosition.dy + kToolbarHeight + renderBox.size.height,
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Pause/Disable Account',
          child: Text('Pause/Disable Account'),
        ),
        PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('Delete Account'),
        ),
        PopupMenuItem<String>(
          value: 'Activate Code',
          child: Text('Activate Code  '),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedValue = value;
        });
      }
    });
  }
}
