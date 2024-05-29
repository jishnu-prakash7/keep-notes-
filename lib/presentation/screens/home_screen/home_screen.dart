import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/model.dart';
import 'package:note_app/presentation/screens/add_note_screen.dart/add_note_screen.dart';
import 'package:note_app/presentation/screens/home_screen/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> images = [
  'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference myNotes =
      FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keep Notes',
          style: TextStyle(color: ConstColors.kwhite),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: ConstColors.kwhite,
            )),
      ),
      body: ListView(
        children: [
          StreamBuilder(
              stream: myNotes.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final notes = snapshot.data!.docs;
                List<NoteCard> noteCards = [];
                for (var note in notes) {
                  var data = note.data() as Map<String, dynamic>?;
                  if (data != null) {
                    Note noteObj = Note(
                        id: note.id,
                        title: data['title'] ?? '',
                        note: data['note'] ?? '',
                        createdAt: data.containsKey('createdAt')
                            ? (data['createdAt'] as Timestamp).toDate()
                            : DateTime.now(),
                        updatedAt: data.containsKey('updatedAt')
                            ? (data['updatedAt'] as Timestamp).toDate()
                            : DateTime.now(),
                        color: data.containsKey('color')
                            ? data['color']
                            : 0xFFFFFFFF);
                    noteCards.add(NoteCard(
                        note: noteObj,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NoteScreen(note: noteObj)));
                        }));
                  }
                }
                if (noteCards.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Notes Found',
                      style: TextStyle(
                          color: ConstColors.kwhite,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  );
                } else {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: noteCards.length,
                      itemBuilder: (context, index) {
                        return noteCards[index];
                      });
                }
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColors.kwhite,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteScreen(
                note: Note(
                    id: '',
                    title: '',
                    note: '',
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now()),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
