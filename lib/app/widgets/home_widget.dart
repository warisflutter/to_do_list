import 'package:flutter/material.dart';

class TaskCategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color boxColor; // 👈 background box color

  const TaskCategoryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: boxColor.withOpacity(0.9), // 👈 solid box color
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white, //  ab hamesha white icon
              size: 24,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 28,
          ),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}

// 👇 Pure Task Categories section
class TaskCategorySection extends StatelessWidget {
  const TaskCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Tasks",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle,
                    color: Colors.deepPurple, size: 28),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Add Task tapped!")),
                  );
                },
              ),
            ],
          ),
        ),

        // --- Category Container
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              TaskCategoryTile(
                icon: Icons.today,
                title: "Today",
                subtitle: "5 Tasks",
                onTap: () {},
                boxColor: Colors.blue,
              ),
              TaskCategoryTile(
                icon: Icons.calendar_today_outlined,
                title: "Tomorrow",
                subtitle: "3 Tasks",
                onTap: () {},
                boxColor: Colors.green,
              ),
              TaskCategoryTile(
                icon: Icons.date_range,
                title: "This Week",
                subtitle: "10 Tasks",
                onTap: () {},
                boxColor: Colors.orange,
              ),
              TaskCategoryTile(
                icon: Icons.event_note,
                title: "Later",
                subtitle: "2 Tasks",
                onTap: () {},
                boxColor: Colors.yellow[700]!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
