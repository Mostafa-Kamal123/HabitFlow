import 'package:flutter/material.dart';

class Profilecard extends StatefulWidget {
  const Profilecard({super.key, required this.selectedAvatar, required this.name, required this.avatars, required this.onAvatarChanged, required this.onNameChanged, required this.onSave});
  final String selectedAvatar;
  final String name;
  final List<String> avatars;
  final ValueChanged<String> onAvatarChanged;
  final ValueChanged<String> onNameChanged;
  final VoidCallback onSave;

  @override
  State<Profilecard> createState() => _ProfilecardState();
}

class _ProfilecardState extends State<Profilecard> {
  
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
  return Container(
    height: 150,
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(context),
    child: Row(
      children: [
        GestureDetector(
          onTap: _showAvatarPicker, // 🔥
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(widget.selectedAvatar),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 18, color: isLightTheme ? Colors.black : Colors.white),
          ),
        ),
        TextButton(
          onPressed: _editName,
          child: Text("Edit", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
        )
      ],
    ),
  );
}


void _editName() async {
  TextEditingController controller = TextEditingController(text: widget.name);

  String? result = await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Edit Name"),
      content: TextField(
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, controller.text);
          },
          child: Text("Save"),
        )
      ],
    ),
  );

  if (result != null && result.isNotEmpty) {
    widget.onNameChanged(result);
    widget.onSave();
    setState(() {
      // Keep card display in sync with parent state.
    });
  }
}
void _showAvatarPicker() {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: widget.avatars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onAvatarChanged(widget.avatars[index]);
                  widget.onSave();
                });
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.avatars[index]),
              ),
            );
          },
        ),
      );
    },
  );
}
}

BoxDecoration _cardDecoration(BuildContext context) {
  bool isLightTheme = Theme.of(context).brightness == Brightness.light;
  return BoxDecoration(
    color: isLightTheme ? const Color.fromRGBO(255, 255, 255, 0.85) : const Color(0xFF2A2E3F).withAlpha(230),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 15,
        color: const Color.fromRGBO(0, 0, 0, 0.1),
      )
    ],
  );
}
