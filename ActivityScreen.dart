import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ActivityLogScreen extends StatelessWidget {
  const ActivityLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Log'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search activities...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        index % 3 == 0
                            ? Icons.task
                            : index % 2 == 0
                            ? Icons.comment
                            : Icons.check_circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text(
                      index % 3 == 0
                          ? 'Task created'
                          : index % 2 == 0
                          ? 'Comment added'
                          : 'Task completed',
                    ),
                    subtitle: Text(
                      DateFormat('MMM dd, HH:mm').format(
                        DateTime.now().subtract(Duration(hours: index)),
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/task-detail',
                        arguments: {
                          'title': 'Task ${index + 1}',
                          'description': 'Description for task ${index + 1}',
                          'priority': index % 3 == 0 ? 'High' : 'Medium',
                          'progress': (index + 1) * 0.2,
                          'dueDate': DateTime.now().add(Duration(days: index + 1)),
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}