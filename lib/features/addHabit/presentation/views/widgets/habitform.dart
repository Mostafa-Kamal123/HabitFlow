
import 'package:flutter/material.dart';

class HabitForm extends StatefulWidget {
  HabitForm({
    super.key,
    required this.icon,
    required this.color,
    required this.targetCount,
    required this.onTargetCountChanged,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    this.initialName = '',
    this.initialDescription = '',
  });

  final IconData icon;
  final Color color;
  final int targetCount;
  final ValueChanged<int> onTargetCountChanged;
  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final String initialName;
  final String initialDescription;
  @override
  State<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  late TextEditingController habitNameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    habitNameController = TextEditingController(text: widget.initialName);
    descriptionController = TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    habitNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: isLightTheme ? Colors.white : const Color(0xFF2A2E3F),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Icon(widget.icon, size: 35, color: Colors.white)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: habitNameController,
                      decoration: InputDecoration(
                        labelText: 'Habit Name',
                        labelStyle: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: isLightTheme ? Colors.black54 : Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: isLightTheme ? Colors.black : Colors.white),
                        ),
                      ),
                      style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                      onChanged: widget.onNameChanged,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: isLightTheme ? Colors.black54 : Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: isLightTheme ? Colors.black : Colors.white),
                        ),
                      ),
                      style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                      onChanged: widget.onDescriptionChanged,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Target Count',
                  style: TextStyle(color: isLightTheme ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (widget.targetCount > 1) {
                    widget.onTargetCountChanged(widget.targetCount - 1);
                  }
                },
                icon: Icon(Icons.remove, color: isLightTheme ? Colors.black : Colors.white),
              ),
              Text(
                '${widget.targetCount}',
                style: TextStyle(color: isLightTheme ? Colors.black : Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  widget.onTargetCountChanged(widget.targetCount + 1);
                },
                icon: Icon(Icons.add, color: isLightTheme ? Colors.black : Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
