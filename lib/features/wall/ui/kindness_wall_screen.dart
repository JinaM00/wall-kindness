import 'package:flutter/material.dart';
import '../models/kind_note.dart';
import '../../../router/app_router.dart';
import 'my_notes-screen.dart'; // 👈 make sure this file exists
import 'package:kindness_wall/features/uplift/ui/uplift_screen.dart'; // 👈 optional: if you want Uplift button

class KindnessWallScreen extends StatefulWidget {
  final String currentUserId;
  const KindnessWallScreen({super.key, required this.currentUserId});

  @override
  State<KindnessWallScreen> createState() => _KindnessWallScreenState();
}

class _KindnessWallScreenState extends State<KindnessWallScreen> {
  List<KindNote> notes = [
    KindNote(
      id: '1',
      text: 'You matter more than you know 💛',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    KindNote(
      id: '2',
      text: 'Small acts of kindness change the world 🌍',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
    KindNote(
      id: '3',
      text: 'Kindness lasts forever ✨',
      createdAt: DateTime.now().subtract(const Duration(days: 400)),
    ),
  ];

  String selectedFilter = 'all';
  final TextEditingController noteController = TextEditingController();

  // Filtering logic
  List<KindNote> get filteredNotes {
    final now = DateTime.now();
    if (selectedFilter == '7days') {
      return notes
          .where((n) =>
          n.publishedAt.isAfter(now.subtract(const Duration(days: 7))))
          .toList();
    } else if (selectedFilter == 'month') {
      return notes
          .where((n) =>
          n.publishedAt.isAfter(now.subtract(const Duration(days: 30))))
          .toList();
    } else if (selectedFilter == 'year') {
      return notes
          .where((n) =>
          n.publishedAt.isAfter(now.subtract(const Duration(days: 365))))
          .toList();
    }
    return notes;
  }

  // Heart toggle
  void toggleHeart(KindNote note) {
    if (note.heartedBy.contains(widget.currentUserId)) {
      setState(() {
        note = note.copyWith(
          hearts: note.hearts - 1,
          heartedBy:
          note.heartedBy.where((id) => id != widget.currentUserId).toList(),
        );
        notes = notes.map((n) => n.id == note.id ? note : n).toList();
      });
    } else {
      setState(() {
        note = note.copyWith(
          hearts: note.hearts + 1,
          heartedBy: [...note.heartedBy, widget.currentUserId],
        );
        notes = notes.map((n) => n.id == note.id ? note : n).toList();
      });
    }
  }

  // Add new note
  void addNote() {
    if (noteController.text.trim().isEmpty) return;

    final newNote = KindNote(
      id: '${widget.currentUserId}_${DateTime.now().millisecondsSinceEpoch}',
      text: noteController.text.trim(),
      createdAt: DateTime.now(),
      publishedAt: DateTime.now(),
      hearts: 0,
      heartedBy: [],
    );

    setState(() {
      notes.insert(0, newNote);
      noteController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindness Wall'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('All')),
              const PopupMenuItem(value: '7days', child: Text('Last 7 days')),
              const PopupMenuItem(value: 'month', child: Text('Last Month')),
              const PopupMenuItem(value: 'year', child: Text('Last Year')),
            ],
            icon: const Icon(Icons.filter_list),
          ),
          IconButton(
            icon: const Icon(Icons.note),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyNotesScreen(
                    currentUserId: widget.currentUserId,
                    allNotes: notes,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sunny), // 🌞 uplift button
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpliftScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.routeSettings);
            },
          ),
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.routeLogin);
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRouter.routeWelcome);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Input field at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: 'Write your kindness note...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addNote,
                  child: const Text('Post'),
                ),
              ],
            ),
          ),
          // Filter label
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Currently showing: ${selectedFilter == 'all' ? 'All notes' : selectedFilter == '7days' ? 'Last 7 days' : selectedFilter == 'month' ? 'Last Month' : 'Last Year'}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Notes list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final note = filteredNotes[index];
                return Card(
                  color: Colors.pink[50], // 👈 pastel light pink message box
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(note.text),
                    subtitle: Text(
                      'Published: ${note.publishedAt.toLocal().toString().split(' ')[0]}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${note.hearts}'),
                        IconButton(
                          icon: Icon(
                            note.heartedBy.contains(widget.currentUserId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: note.heartedBy.contains(widget.currentUserId)
                                ? Colors.red
                                : null,
                          ),
                          onPressed: () => toggleHeart(note),
                        ),
                      ],
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