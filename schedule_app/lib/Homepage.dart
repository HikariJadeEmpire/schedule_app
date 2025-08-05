import 'package:flutter/material.dart';
import 'package:schedule_app/SummaryPage.dart';
import 'variablesPage.dart';
import 'dart:ui';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  late int selectedPage;

  Widget getCurrentPage(numPage) {
    if (numPage == 1) {
      return Placeholder();
    } else if (numPage == 2) {
      return Placeholder();
    } else {
      return SummaryPages();
    }
  }

  @override
  void initState() {
    super.initState();

    // Add init vars
    selectedPage = 0;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.primary,
      drawerScrimColor: Theme.of(context).colorScheme.onPrimary,
      
      body: IndexedStack(

        // IndexedStack is helping when we move to another page and then come back, the recent item still remain

      children: [
        Stack(
          children: [

            getCurrentPage(selectedPage),

            //// Bottom Nav bar
            
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
  
                height: 80,
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 32,
                ),

                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                    
                      spacing: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: mainNavIcons.map((icon) {
                    
                        int index = mainNavIcons.indexOf(icon);
                        bool isSelected = selectedPage == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPage = index;
                            });
                          },
                          child: AnimatedOpacity(
                            opacity: isSelected ?
                              1.0
                              : 0.3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            child: Icon(
                              icon, 
                              size: 30,
                              ),
                          ),
                        );

                        }
                      ).toList(),
                    ),
                  ),
                ),
                
              )
            ),

          ]
        ),
        ],
      ),

    );
  }
}