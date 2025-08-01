import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskArchiveScreen extends StatelessWidget {
  const TaskArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Archive'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    value: 'All',
                    items: ['All', 'High', 'Medium', 'Low']
                        .map((priority) => DropdownMenuItem(
                      value: priority,
                      child: Text(priority),
                    ))
                        .toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Filter by Priority',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField(
                    value: 'Recent',
                    items: ['Recent', 'Last Week', 'Last Month', 'Older']
                        .map((time) => DropdownMenuItem(
                      value: time,
                      child: Text(time),
                    ))
                        .toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Filter by Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: CheckboxListTile(
                    title: Text(
                      'Completed Task ${index + 1}',
                      style: GoogleFonts.poppins(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    subtitle: Text(
                        'Completed on ${DateTime.now().subtract(Duration(days: index + 1)).toString().substring(0, 10)}'),
                    value: true,
                    onChanged: (value) {},
                    secondary: IconButton(
                      icon: const Icon(Icons.restore),
                      onPressed: () {},
                    ),
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