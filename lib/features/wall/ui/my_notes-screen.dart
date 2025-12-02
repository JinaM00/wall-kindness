import 'package:flutter/material.dart';
import '../models/kind_note.dart';

class MyNotesScreen extends StatelessWidget {
  final String currentUserId;
  final List<KindNote> allNotes;

  const MyNotesScreen({
    super.key,
    required this.currentUserId,
    required this.allNotes,
  });

  @override
  Widget build(BuildContext context) {
    // Filter notes written by this user
    final myNotes = allNotes.where((n) => n.id.startsWith(currentUserId)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: myNotes.isEmpty
          ? const Center(child: Text('You haven’t written any notes yet 💭'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: myNotes.length,
        itemBuilder: (context, index) {
          final note = myNotes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(note.text),
              subtitle: Text(
                'Published: ${note.publishedAt.toLocal().toString().split(' ')[0]}',
              ),
              trailing: Text('${note.hearts} ❤️'),
            ),
          );
        },
      ),
    );
  }
}