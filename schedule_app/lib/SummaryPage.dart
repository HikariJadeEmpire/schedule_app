import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/variablesPage.dart';
import 'package:schedule_app/widgets_page.dart';
import 'functions.dart';


class SummaryPages extends StatefulWidget {
  const SummaryPages({super.key});

  @override
  State<SummaryPages> createState() => _SummaryPagesState();
}

class _SummaryPagesState extends State<SummaryPages> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              'INFO',
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    
            Container(
    
              // color: Theme.of(context).colorScheme.onSecondaryContainer,
              margin: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 10
              ),
              height: 230,
    
              child: Column(
                spacing: 8,
                children: [
              
                  SizedBox(
                    width: 34,
                    child: Text(
                      ' ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
              
                  Container(
                    
                    height: 180,
                    width: 34,
                    margin: EdgeInsets.symmetric(
                      // vertical: 20,
                      horizontal: 5,
                    ),
                  
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                ],
              ),
            ),
    
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10
              ),
              width: 300,
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
              
                  children: [
                    
                    SizedBox(
                      height: 220,
                      width: 170,
                      child: SummaryCalendar(
                        listOfDates: generateDatesGrid(
                          DateTime(
                            Provider.of<MainProvider>(context).todayy.year,
                            Provider.of<MainProvider>(context).todayy.month - 1,
                            1
                            ),
                        ),
                        inspectDay: DateTime(
                            Provider.of<MainProvider>(context).todayy.year,
                            Provider.of<MainProvider>(context).todayy.month - 1,
                            1
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      width: 170,
                      child: SummaryCalendar(
                        listOfDates: Provider.of<MainProvider>(context).currentDateGrid,
                        inspectDay: Provider.of<MainProvider>(context).todayy,
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      width: 170,
                      child: SummaryCalendar(
                        listOfDates: generateDatesGrid(
                          DateTime(
                            Provider.of<MainProvider>(context).todayy.year,
                            Provider.of<MainProvider>(context).todayy.month + 1,
                            1
                            ),
                        ),
                        inspectDay: DateTime(
                            Provider.of<MainProvider>(context).todayy.year,
                            Provider.of<MainProvider>(context).todayy.month + 1,
                            1
                            ),
                      ),
                    ),
                
                  ]
                
              ),
            ),
    
          ],
        ),
      ),
    
    
      //// For UI experiment
      
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            color: index.isOdd ? Colors.white : Colors.black12,
            height: 100.0,
            child: Center(child: Text('$index', textScaler: const TextScaler.linear(5))),
          );
        }, childCount: 20),
      ),
    
      //// END of UI experiment.
    
      ]
    
      );
  }
}