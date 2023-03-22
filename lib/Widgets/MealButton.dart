import 'package:flutter/material.dart';

class MealButton extends StatefulWidget {
  final String meal;
  final int cal;
  final Color color;
  final VoidCallback dosumn;

  const MealButton({
    super.key,
    required this.meal,
    required this.color,
    this.cal = 0,
    required this.dosumn  
    });

  @override
  State<MealButton> createState() => _MealButtonState();
}

class _MealButtonState extends State<MealButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.dosumn,
      borderRadius: BorderRadius.circular(48),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: widget.color,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.meal, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
            Flexible(child: Container()),
            widget.cal > 0? const Icon(Icons.fireplace) : Container(),
            const SizedBox(width: 10,),
            widget.cal>0? 
            Text("${widget.meal} cal",style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)) 
            : const Text("ADD", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}