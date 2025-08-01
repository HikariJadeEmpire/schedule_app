import 'package:flutter/material.dart';

class SummaryPages extends StatefulWidget {
  const SummaryPages({super.key});

  @override
  State<SummaryPages> createState() => _SummaryPagesState();
}

class _SummaryPagesState extends State<SummaryPages> {
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
        
          SliverToBoxAdapter(),

          ]

          ),
        ],
      );
  }
}