import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/model.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({super.key, required this.note});

  @override
  State<NoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<NoteScreen> {
  final CollectionReference myNotes =
      FirebaseFirestore.instance.collection('notes');
  late TextEditingController titleController;
  late TextEditingController noteController;

  late Note note = widget.note;
  String noteValue = '';
  String noteTitle = '';
  late int color;

  @override
  void initState() {
    noteValue = note.note;
    noteTitle = note.title;
    note = widget.note;
    color = note.color == 0xFFFFFFFF ? generateRandomColor() : note.color;
    noteController = TextEditingController(text: noteValue);
    titleController = TextEditingController(text: noteTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: ConstColors.kwhite,
      //       )),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Constants.kheight40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: ConstColors.kwhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        // color: ConstColors.kwhite,
                      ),
                    ),
                  ),
                ),
                Text(
                  note.id.isEmpty ? 'Add note' : 'Edit Note',
                  style: const TextStyle(color: ConstColors.kwhite),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: ConstColors.kwhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            saveNotes();
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.save,
                            // color: ConstColors.kwhite,
                          ),
                        ),
                        if (note.id.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              myNotes.doc(note.id).delete();
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.delete,
                              // color: ConstColors.kwhite,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Constants.kheight20,
            textformfield(
              title: 'Title',
              controller: titleController,
              onTextChanged: (String value) {
                noteTitle = value;
              },
            ),
            textformfield(
                title: 'Note',
                controller: noteController,
                onTextChanged: (String value) {
                  noteValue = value;
                })
          ],
        ),
      ),
    );
  }

  Padding textformfield(
      {required String title,
      required TextEditingController controller,
      Function(String)? onTextChanged}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        onChanged: onTextChanged,
        controller: controller,
        maxLines: null,
        style: const TextStyle(color: ConstColors.kwhite),
        decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
            border: const UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }

  void saveNotes() async {
    DateTime now = DateTime.now();
    if (note.id.isEmpty) {
      await myNotes.add({
        'title': noteTitle,
        'note': noteValue,
        'color': color,
        'createdAt': now
      });
    } else {
      await myNotes.doc(note.id).update({
        'title': noteTitle,
        'note': noteValue,
        'color': color,
        'updatedAt': now
      });
    }
  }
}
