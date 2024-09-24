

import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({Key? key}) : super(key: key);

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {

  int index=1;
  int hrs=0;
  int mins=0;
  int secs=0;
  int totalSecs=0;
  Timer? timer;

  void startTimer({bool reset=true}){
      if(reset){
        resetTimer();
      }

      timer= Timer.periodic(Duration(seconds: 1), (timer) {
        if(totalSecs>0){
          setState(() {
            totalSecs--;
          });
        }
        else{
          stopTimer(reset: false);
        }
      });


  }

  void stopTimer({bool reset=true}){
    if(reset){
      resetTimer();
    }

    setState(() {
      timer!.cancel();
    });
  }

  void resetTimer(){
    setState(() {
      hrs=0;
      mins=0;
      secs=0;
      totalSecs=0;
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    bool isRunning= timer==null?false:timer!.isActive;
    return Scaffold(
      appBar: 
        //how to add img as a app bar background?
        AppBar(
 
  flexibleSpace: FlexibleSpaceBar(
    background:  Container(
       decoration: BoxDecoration(
         image: DecorationImage(
      image: AssetImage("assets/appbar.png"),
      fit: BoxFit.cover
    ),
  ),
    )
  )


      ),
      body:DecoratedBox(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/study.jpg"),
          fit: BoxFit.cover
          ),
          ),
       child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
       child : Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
       
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     IconButton(
                         onPressed: increaseTimer,
                         icon: Icon(Icons.keyboard_arrow_up, size: 36)),
                     IconButton(
                         onPressed: decreaseTimer,
                         icon: Icon(Icons.keyboard_arrow_down,size: 36,)),
                   ],
                 ),
               ),
       
               Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                     child: InkWell(
                       onTap: (){
                         setState(() {
                           index=2;
                         });
                       },
                         child: Text('${(totalSecs~/3600).toString().padLeft(2,'0')}:',
                           style: TextStyle(fontSize: 36,
                               color: index==2?Colors.red: Colors.black),)),
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                     child: InkWell(
                       onTap: (){
                         setState(() {
                           index=1;
                         });
                       },
                         child: Text('${((totalSecs/60)%60).toInt().toString().padLeft(2,'0')}:',
                             style: TextStyle(fontSize: 36,
                                 color: index==1?Color.fromARGB(255, 218, 64, 17): Colors.black))),
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                     child: InkWell(
                       onTap: (){
                         setState(() {
                           index=0;
                         });
                       },
                         child: Text('${(totalSecs%60).toInt().toString().padLeft(2,'0')}',
                             style: TextStyle(fontSize: 36,
                                 color: index==0?Colors.red: Colors.black))),
                   ),
                 ],
               ),
             ],
           ),
       
           !isRunning?
           Padding(
             padding:  EdgeInsets.fromLTRB(80, 0, 80, 80),
             child: IconButton(onPressed: (){
               startTimer(reset: false);
             }, 
             icon: ClipRect(child: Image.asset('assets/start.png',
             width: 170,
             height: 80,
             ),),
             
           ),
           )
           :
           Row(
             children: [
               Expanded(
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(30, 0, 20, 30),
                     child: IconButton(
                       onPressed: (){
                         stopTimer(reset: false);
                       },
                                    icon: ClipRect(child: Image.asset('assets/pause.png'),),
                     
                     
                                    
                                    ),
                   )),
               SizedBox(width: 10,),
               Expanded(
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(30, 0, 20, 30),
                     child: IconButton(
                       onPressed: (){
                        stopTimer(reset: true);
                       },
                                      icon: ClipRect(child: Image.asset('assets/block.png'),),
                                      ),
                   )),
             ],
           ),
       
         ]),
      )
      )
    );

  }

  void increaseTimer(){

    if(index==0){
      setState(() {
        secs++;
      });
    }
    if(index==1){
      setState(() {
        mins++;
      });
    }
    if(index==2){
      setState(() {
        hrs++;
      });
    }

    setState(() {
      totalSecs=(hrs*3600 + mins * 60 + secs).abs();
    });

  }

  void decreaseTimer(){
    if(index==0){
      setState(() {
        secs--;
      });
    }
    if(index==1){
      setState(() {
        mins--;
      });
    }
    if(index==2){
      setState(() {
        hrs--;
      });
    }

    setState(() {
      totalSecs=(hrs*3600 + mins * 60 + secs).abs();
    });
  }


}