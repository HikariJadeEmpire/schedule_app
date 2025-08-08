import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'variablesPage.dart';
import 'functions.dart';

class ActionCalendar extends StatefulWidget {

  final List<DateTime> listOfDates;
  final DateTime inspectDay;

  const ActionCalendar({
    super.key,
    required this.listOfDates,
    required this.inspectDay,
    });

  @override
  State<ActionCalendar> createState() => _ActionCalendarState();
}

class _ActionCalendarState extends State<ActionCalendar> {

  final double boxwidth = 320;
  final double boxheight = 320;

  late DateTime dateIsSelected;
  late List<DateTime> dateIsBulkSelected;

  @override
  void initState() {

    super.initState();
    dateIsSelected = Provider.of<MainProvider>(context, listen: false).todayy;

  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(

        // IndexedStack is helping when we move to another page and then come back, the recent item still remain

      children: [
        CustomScrollView(
          slivers : <Widget>[
          
          SliverAppBar(
        
            floating: true,
            snap: false,
            pinned: false,
        
            centerTitle: false,
            expandedHeight: 100,
            collapsedHeight: 70,
        
            backgroundColor: Theme.of(context).colorScheme.primary,
            surfaceTintColor: Theme.of(context).colorScheme.primary,
            
            actions: [
        
              Container(
                // color: getColor(ThemeColr.hilightSecondary),
                margin: EdgeInsets.only(top: 0, right: 30),
                height: 78,
                width: 56,
                child: Icon(Icons.add),
              ),
        
            ],
        
            leading: Icon(Icons.arrow_back_rounded),
            
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                // color: getColor(ThemeColr.hilightSecondary),
                padding: EdgeInsets.all(5.0),
                width: 140,
                
                child: Text(
                  'Shift\nlogging',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        
            // background: FlutterLogo(),
        
            ),
          ),
        
          SliverToBoxAdapter(
            child: Column(

              children: [

                Container(

                  // color: Theme.of(context).colorScheme.onSecondaryContainer,
                  margin: EdgeInsets.all(10),

                  child: Text(
                    'TODO: Design something',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Container(
                    // color: Theme.of(context).colorScheme.onSecondaryContainer,
                    
                    height: boxheight,
                    width: 50,
                    margin: EdgeInsets.symmetric(
                      // vertical: 20,
                      horizontal: 5,
                    ),
                  
                    child: GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                              
                      itemCount: weekMapper.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
                      itemBuilder: (_, int index) {
                  
                        return Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent,
                          ),
                  
                          // height: 4,
                          // width: 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              weekMapper.values.elementAt(index).substring(0, 3),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 9,
                              ),
                              ),
                          ),
                        );
                      }
                    )
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
                            
                      itemCount: widget.listOfDates.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
                      itemBuilder: (_, int index) {
                  
                        // TODO: Use function to show disable/available/1busy/mixedbusy on each day
                  
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              dateIsSelected = widget.listOfDates[index];
                            });

                            Provider
                            .of<MainProvider>(context, listen: false)
                            .dayStatus[index] 
                            
                            = changeStatus(
                              Provider
                              .of<MainProvider>(context, listen: false)
                              .dayStatus[index]
                            );
                            
                            debugPrint("Date : $dateIsSelected has selected\nStatus: ${Provider.of<MainProvider>(context, listen: false).dayStatus[index]}");
                          },
                          child: Container(
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: getCalendaBoxColr(context, Provider.of<MainProvider>(context, listen: false).dayStatus[index]),
                            ),
                                    
                            // height: 4,
                            // width: 4,
                            child: Center(
                              child: Text(
                                "${widget.listOfDates[index].day}",
                                style: TextStyle(
                                  color: Provider.of<MainProvider>(context, listen: false).dayStatus[index] != 'disable' ?
                                  Theme.of(context).colorScheme.onSecondary
                                  : Colors.transparent,
                                  fontSize: 9,
                                ),
                              )
                            ),
                          ),
                        ); 
                        }
                      ),
                    
                  ),
                
                ],
                          ),
              ],
            )

          ),
        ],
      ),
    ]
    );
  }
}