// import 'package:flutter/material.dart';
// import 'package:miniproject2/main.dart';
//
// // void main() {
// //   runApp(const Notes());
// // }
//
// class Notes extends StatelessWidget {
//   // const Notes({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Notepad',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: const NotesApp(),
//     );
//   }
// }
//
// class Note {
//   String topic;
//   String content;
//
//   Note({
//     required this.topic,
//     required this.content,
//   });
// }
//
// class NotesApp extends StatefulWidget {
//   const NotesApp({Key? key}) : super(key: key);
//
//   @override
//   _NotesAppState createState() => _NotesAppState();
// }
//
// class _NotesAppState extends State<NotesApp> {
//   final List<Note> _notes = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notepad'),
//       ),
//       body: ListView.builder(
//         itemCount: _notes.length,
//         itemBuilder: (context, index) {
//           final note = _notes[index];
//           return Card(
//             color: Colors.lightBlue[100],
//             child: ListTile(
//               title: Text(note.topic),
//               subtitle: Text(note.content),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () => _editNoteDialog(index),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () => _deleteNoteDialog(index),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: _addNoteDialog,
//       ),
//     );
//   }
//
//   void _addNoteDialog() async {
//     final Note? newNote = await showDialog(
//       context: context,
//       builder: (context) {
//         String? topic;
//         String? content;
//
//         return AlertDialog(
//           title: const Text('Add Note'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: const InputDecoration(hintText: 'Topic'),
//                 onChanged: (value) => topic = value,
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: const InputDecoration(hintText: 'Content'),
//                 onChanged: (value) => content = value,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('CANCEL'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (topic != null && content != null) {
//                   Navigator.pop(context, Note(
//                     topic: topic!,
//                     content: content!,
//                   ));
//                 }
//               },
//               child: const Text('SAVE'),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (newNote != null) {
//       setState(() {
//         _notes.add(newNote);
//       });
//     }
//   }
//
//   void _editNoteDialog(int index) async {
//     final Note note = _notes[index];
//     String topic = note.topic;
//     String content = note.content;
//
//     final Note? editedNote = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Edit Note'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: const InputDecoration(hintText: 'Topic'),
//                 controller: TextEditingController(text: topic),
//                 onChanged: (value) => topic = value,
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: const InputDecoration(hintText: 'Content'),
//                 controller: TextEditingController(text: content),
//                 onChanged: (value) => content = value,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('CANCEL'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (topic.isNotEmpty && content.isNotEmpty) {
//                   Navigator.pop(context, Note(
//                     topic: topic,
//                     content: content,
//                   ));
//                 }
//               },
//               child: const Text('SAVE'),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (editedNote != null) {
//       setState(() {
//         _notes[index] = editedNote;
//       });
//     }
//   }
//
//   void _deleteNoteDialog(int index) async {
//     final bool? confirmDelete = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Confirm Delete'),
//           content: const Text('Are you sure you want to delete this note?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//               child: const Text('CANCEL'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: const Text('DELETE'),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (confirmDelete == true) {
//       setState(() {
//         _notes.removeAt(index);
//       });
//     }
//   }
// }
//
//
//




import 'package:flutter/material.dart';
import 'package:miniproject2/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(const Notes());
// }

class Notes extends StatelessWidget {
  // const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const NotesApp(),
    );
  }
}

// class Note {
//   String topic;
//   String content;
//
//   Note({
//     required this.topic,
//     required this.content,
//   });
//
//   static Note fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return Note(
//       //id: doc.id,
//       topic: data['topic'] ?? '',
//       content: data['content'] ?? '',
//     );
//   }
// }

class Note {
  final String id;
  final String topic;
  final String content;

  Note({
    required this.id,
    required this.topic,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'content': content,
    };
  }
  factory Note.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      topic: data['topic'] ?? '',
      content: data['content'] ?? '',
      //timestamp: data['timestamp'] ?? DateTime.now(),
    );
  }

}


class NotesApp extends StatefulWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  final List<Note> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notepad'),
      ),
      body: StreamBuilder<List<Note>>(
        stream: getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              final notes = snapshot.data!;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Card(
                    color: Colors.lightBlue[100],
                    child: ListTile(
                      title: Text(note.topic),
                      subtitle: Text(note.content),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _editNoteDialog(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteNoteDialog(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
      // body: ListView.builder(
      //   itemCount: _notes.length,
      //   itemBuilder: (context, index) {
      //     final note = _notes[index];
      //     return Card(
      //       color: Colors.lightBlue[100],
      //       child: ListTile(
      //         title: Text(note.topic),
      //         subtitle: Text(note.content),
      //         trailing: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(
      //               icon: const Icon(Icons.edit),
      //               onPressed: () => _editNoteDialog(index),
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.delete),
      //               onPressed: () => _deleteNoteDialog(index),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNoteDialog,
      ),
    );
  }

  void _addNoteDialog() async {
    String topic = '';
    String content = '';

    final Note? newNote = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Topic'),
                onChanged: (value) => topic = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(hintText: 'Content'),
                onChanged: (value) => content = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (topic.isNotEmpty && content.isNotEmpty) {
                  final docRef = await FirebaseFirestore.instance.collection('notes').add({
                    'topic': topic,
                    'content': content,
                    'timestamp': Timestamp.now(),
                  });
                  final newNote = Note(
                    id: docRef.id,
                    topic: topic,
                    content: content,
                    //timestamp: Timestamp.now(),
                  );
                  Navigator.pop(context, newNote);
                }
              },
              child: const Text('SAVE'),
            ),
          ],
        );
      },
    );

    if (newNote != null) {
      setState(() {
        _notes.add(newNote);
      });
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addNoteToFirestore(Note note) async {
    try {
      await FirebaseFirestore.instance.collection('notes').doc(note.id).set({
        'id': note.id,
        'topic': note.topic,
        'content': note.content,
        //'timestamp': note.timestamp,
      });
      print('Note added successfully.');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  Stream<List<Note>> getNotes() {
    return FirebaseFirestore.instance
        .collection('notes')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
        .map((doc) => Note.fromFirestore(doc))
        .toList());
  }


  // void _editNoteDialog(int index) async {
  //   final Note note = _notes[index];
  //   String topic = note.topic;
  //   String content = note.content;
  //
  //   final Note? editedNote = await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Edit Note'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               decoration: const InputDecoration(hintText: 'Topic'),
  //               controller: TextEditingController(text: topic),
  //               onChanged: (value) => topic = value,
  //             ),
  //             const SizedBox(height: 16),
  //             TextField(
  //               decoration: const InputDecoration(hintText: 'Content'),
  //               controller: TextEditingController(text: content),
  //               onChanged: (value) => content = value,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('CANCEL'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (topic.isNotEmpty && content.isNotEmpty) {
  //                 Navigator.pop(context, Note(
  //                   topic: topic,
  //                   content: content,
  //                 ));
  //               }
  //             },
  //             child: const Text('SAVE'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  //   if (editedNote != null) {
  //     setState(() {
  //       _notes[index] = editedNote;
  //     });
  //   }
  // }

  // void _editNoteDialog(int index) async {
  //   final Note note = _notes[index];
  //   String topic = note.topic;
  //   String content = note.content;
  //
  //   final Note? editedNote = await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Edit Note'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               decoration: const InputDecoration(hintText: 'Topic'),
  //               controller: TextEditingController(text: topic),
  //               onChanged: (value) => topic = value,
  //             ),
  //             const SizedBox(height: 16),
  //             TextField(
  //               decoration: const InputDecoration(hintText: 'Content'),
  //               controller: TextEditingController(text: content),
  //               onChanged: (value) => content = value,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('CANCEL'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (topic.isNotEmpty && content.isNotEmpty) {
  //                 Navigator.pop(context, Note(
  //                   topic: topic,
  //                   content: content,
  //                 ));
  //               }
  //             },
  //             child: const Text('SAVE'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  //   if (editedNote != null) {
  //     setState(() {
  //       _notes[index] = editedNote;
  //     });
  //
  //     final CollectionReference notesCollection = FirebaseFirestore.instance.collection('notes');
  //     notesCollection.doc(note.id).update({
  //       'topic': editedNote.topic,
  //       'content': editedNote.content,
  //     });
  //   }
  // }

// Update and edit notes

  void _editNoteDialog(int index) async {
    final Note note = _notes[index];
    String topic = note.topic;
    String content = note.content;

    final Note? editedNote = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Topic'),
                controller: TextEditingController(text: topic),
                onChanged: (value) => topic = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(hintText: 'Content'),
                controller: TextEditingController(text: content),
                onChanged: (value) => content = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                if (topic.isNotEmpty && content.isNotEmpty) {
                  Navigator.pop(context, Note(
                    id: note.id, // pass the existing note's ID to the new Note instance
                    topic: topic,
                    content: content,
                  ));
                }
              },
              child: const Text('SAVE'),
            ),
          ],
        );
      },
    );
    if (editedNote != null) {
      setState(() {
        _notes[index] = editedNote;
      });
      await updateNoteInFirestore(editedNote); // update the edited note in Firestore
    }
  }
  Future<void> updateNoteInFirestore(Note note) async {
    try {
      await FirebaseFirestore.instance.collection('notes').doc(note.id).update({
        'topic': note.topic,
        'content': note.content,
        //'timestamp': note.timestamp,
      });
      print('Note updated successfully.');
    } catch (e) {
      print('Error updating note: $e');
    }
  }


  void _deleteNoteDialog(int index) async {
    final bool? confirmDelete = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      setState(() {
        _notes.removeAt(index);
      });
    }
  }
}



