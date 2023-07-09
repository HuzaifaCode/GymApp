import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewBuilderComponent extends StatefulWidget {
  const ListViewBuilderComponent({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderComponent> createState() =>
      _ListViewBuilderComponentState();
}

class _ListViewBuilderComponentState extends State<ListViewBuilderComponent> {
  List<String> tasks = [
    "Do 10 push-Ups on a daily basis.",
    "Do 10 planks for 6 days.",
    "Go for running at 6 am in the morning for 7 days",
    "Lunges: 3 sets of 10 reps per leg",
    "Jumping Jacks: 3 sets of 20 reps",
    "Bicycle Crunches: 3 sets of 15 reps per side",
    "Go for running at 6 am in the morning for 7 days",
  ];
  late List<bool> taskStatus;

  @override
  void initState() {
    super.initState();
    taskStatus = List<bool>.filled(tasks.length, false);
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thickness: 9,
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Checkbox(
                  value: taskStatus[index],
                  onChanged: (bool? newValue) {
                    setState(() {
                      taskStatus[index] = newValue ?? false;
                    });
                  },
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    tasks[index],
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
