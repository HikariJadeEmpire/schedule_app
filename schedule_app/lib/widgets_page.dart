import 'package:flutter/material.dart';
import 'package:schedule_app/variablesPage.dart';
import 'functions.dart';
import 'package:provider/provider.dart';
// import 'dart:ui';

class SummaryCalendar extends StatelessWidget {

  final List<DateTime> listOfDates;
  final DateTime inspectDay;

  SummaryCalendar({
    super.key,
    required this.listOfDates,
    required this.inspectDay,
    });

  final gridSpace = EdgeInsets.all(1);
  final double boxwidth = 220;
  final double boxheight = 180;

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 8,
      children: [
    
        SizedBox(
          width: boxwidth,
          child: Text(monthMapper[
            inspectDay.month
          ]!,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
    
        Container(
          // color: Theme.of(context).colorScheme.onSecondaryContainer,
          
          height: boxheight,
          width: boxwidth,
          margin: EdgeInsets.symmetric(
            // vertical: 20,
            horizontal: 5,
          ),
        
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
                  
            scrollDirection: Axis.horizontal,
                  
            itemCount: listOfDates.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemBuilder: (_, int index) {

              final List<String> gridstatus = getStatusCalendar(listOfDates, inspectDay);
        
              return Container(
                margin: gridSpace,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: getCalendaBoxColr(context, gridstatus[index]),
                ),
                        
                child: Center(
                  child: Text(
                    "${listOfDates[index].day}",
                    style: TextStyle(
                      color: gridstatus[index] != 'disable' ?
                      Theme.of(context).colorScheme.onSecondary
                      : Colors.transparent,
                      fontSize: 9,
                    ),
                  )
                ),
              ); 
              }
            ),
          
        ),
      ],
    )
    ;
  }
}