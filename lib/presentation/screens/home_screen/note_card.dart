import 'package:flutter/material.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/model.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onPressed;
  const NoteCard({super.key, required this.note, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Color(note.color),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis),
              ),
              Constants.kkheight10,
              Flexible(
                  child: Text(
                maxLines: 4,
                note.note,
                style: const TextStyle(
                    fontSize: 17, overflow: TextOverflow.ellipsis),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
