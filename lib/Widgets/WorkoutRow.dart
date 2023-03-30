import 'package:calori_fit/models/Workout.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class WorkoutRow extends StatefulWidget {
  const WorkoutRow(
      {super.key,
      required this.rowNum,
      required this.text,
      required this.workout,
      this.durationController
      });
  final TextEditingController? durationController;
  final String text;
  final int rowNum;
  final Workout workout;

  @override
  State<WorkoutRow> createState() => _WorkoutRowState();
}

class _WorkoutRowState extends State<WorkoutRow> {

  int duration = 0;

  void onType(){
    setState(() {
      duration = int.parse(widget.durationController!.text==""?"0":widget.durationController!.text);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.durationController != null){
      widget.durationController!.addListener(onType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 150,
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Flexible(child: Container()),
          widget.rowNum == 0?
          Expanded(
            child: TextField(
              controller: widget.durationController,
              keyboardType: TextInputType.number,
            ),
          )
          :
          Text(widget.rowNum ==1? 
            "${widget.workout.calsPerMin} cal/min" 
            : 
            "${widget.workout.calsPerMin * duration} cal",
            style: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 18),
          ),
        ],
      ),
    );
  }
}