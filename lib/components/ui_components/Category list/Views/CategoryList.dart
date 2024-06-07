import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            CategoryChip(label: 'Management', icon: Icons.business),
            CategoryChip(label: 'Creativity', icon: Icons.lightbulb_outline),
            CategoryChip(label: 'Environment', icon: Icons.nature),
            CategoryChip(label: 'Career & success', icon: Icons.emoji_events),
            CategoryChip(label: 'Technology', icon: Icons.computer),
            CategoryChip(label: 'Develop', icon: Icons.code),
            CategoryChip(label: 'Design', icon: Icons.design_services),
            CategoryChip(label: 'Psychology', icon: Icons.psychology),
          ],
        ),
      ],
    );
  }
}

class CategoryChip extends StatefulWidget {
  final String label;
  final IconData icon;

  const CategoryChip({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(
        widget.icon,
        color: isSelected
            ? Theme.of(context).colorScheme.onTertiary
            : Theme.of(context).colorScheme.onSecondary,
      ),
      label: Text(widget.label),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.tertiary
          : Colors.transparent,
      labelStyle: TextStyle(
        color: isSelected
            ? Theme.of(context).colorScheme.onTertiary
            : Theme.of(context).colorScheme.onSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
