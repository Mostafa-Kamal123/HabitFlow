import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habitcard.dart';

class HabitListView extends StatefulWidget {
  const HabitListView({
    super.key,
    required this.habits,
    required this.onHabitUpdated,
    required this.onHabitDeleted,
    this.showHeader = true,
    this.onSeeAll,
  });

  final List<HabitModel> habits;
  final void Function(int index, HabitModel habit) onHabitUpdated;
  final void Function(int index) onHabitDeleted;
  final bool showHeader;
  final VoidCallback? onSeeAll;

  @override
  State<HabitListView> createState() => _HabitListViewState();
}

class _HabitListViewState extends State<HabitListView> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        if (widget.showHeader)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Habits",
                  style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                ),
                TextButton(
                  onPressed: widget.onSeeAll,
                  child: Row(
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(color: isLightTheme ? Colors.grey : Colors.grey[400]),
                      ),
                      const SizedBox(width: 5),
                      FaIcon(FontAwesomeIcons.arrowRight, color: isLightTheme ? Colors.grey : Colors.grey[400]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ...widget.habits.asMap().entries.map((entry) {
          final index = entry.key;
          final habit = entry.value;

          return HabitCard(
            habit: habit,
            index: index,
            onHabitUpdated: (updatedHabit) => widget.onHabitUpdated(index, updatedHabit),
            onHabitDeleted: (deletedIndex) => widget.onHabitDeleted(deletedIndex),
          );
        }),
      ],
    );
  }
}
