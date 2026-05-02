
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/presentation/views/editHabitPage.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habit_progress_circle.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({
    super.key,
    required this.habit,
    required this.index,
    required this.onHabitUpdated,
    required this.onHabitDeleted,
  });

  final HabitModel habit;
  final int index;
  final ValueChanged<HabitModel> onHabitUpdated;
  final ValueChanged<int> onHabitDeleted;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return GestureDetector(
      onTap: () => _showCountDialog(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isLightTheme ? Colors.white : const Color(0xFF2A2E3F),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          leading: Icon(IconData(widget.habit.icon, fontFamily: 'MaterialIcons'), size: 30, color: Color(widget.habit.color)),
          title: Text(widget.habit.name, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
          subtitle: Row(
            children: [
              FaIcon(FontAwesomeIcons.fire, color: Colors.red, size: 15),
              const SizedBox(width: 6),
              Text('${widget.habit.days} days', style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
            ],
          ),
          trailing: SizedBox(
            width: 150,
            height: 70,
            child: Row(
              children: [
                HabitProgressCircle(
                  current: widget.habit.currentCount,
                  total: widget.habit.targetCount,
                  isCompleted: widget.habit.isCompleted,
                ),
                // const SizedBox(width: 5),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.habit.isCompleted = true;
                      widget.habit.currentCount = widget.habit.targetCount;
                      _addTodayCompletion(widget.habit);
                      widget.habit.days = widget.habit.completedDates.length;
                      widget.habit.save();
                    });
                    widget.onHabitUpdated(widget.habit);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 35,
                    color: widget.habit.isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _editHabit(context);
                    } else if (value == 'delete') {
                      _deleteHabit(context);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCountDialog(BuildContext context) {
    int dialogCount = widget.habit.currentCount;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Update count for ${widget.habit.name}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Target: ${widget.habit.targetCount}'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (dialogCount > 0) {
                            setState(() {
                              dialogCount--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        '$dialogCount',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          if (dialogCount < widget.habit.targetCount) {
                            setState(() {
                              dialogCount++;
                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.habit.currentCount = dialogCount;
                      widget.habit.isCompleted = dialogCount >= widget.habit.targetCount;
                      if (widget.habit.isCompleted) {
                        _addTodayCompletion(widget.habit);
                        widget.habit.days = widget.habit.completedDates.length;
                      }
                      widget.habit.save();
                    });
                    widget.onHabitUpdated(widget.habit);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editHabit(BuildContext context) {
    Get.to(() => EditHabitPage(habit: widget.habit, index: widget.index));
  }

  void _deleteHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Habit'),
          content: Text('Are you sure you want to delete "${widget.habit.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                widget.onHabitDeleted(widget.index);
                Navigator.of(context).pop();
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _addTodayCompletion(HabitModel habit) {
    final today = DateTime.now();
    final normalized = DateTime(today.year, today.month, today.day);
    if (!habit.completedDates.any((date) => date.year == normalized.year && date.month == normalized.month && date.day == normalized.day)) {
      habit.completedDates.add(normalized);
    }
  }
}
