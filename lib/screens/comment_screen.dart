import 'package:cmmtbook/controllers/homepage_controller.dart';
import 'package:cmmtbook/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

final HomepageController homepageController=Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
        body: Obx(
      () => CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: size.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/sherlock.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          _getSlivers(homepageController.lstDataOfComments, context),
          
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         height: 30,
          //         child: Row(
          //           children: [
          //             Container(
          //               width: size.width * 0.2,
          //               color: Colors.red,
          //               child: CircleAvatar(
          //                 backgroundImage: AssetImage('assets/images/booklogo.png') ,
          //               ),
          //             ),
          //             Container(
          //               width: size.width * 0.7,
          //               color: Colors.amber,
          //             ),
          //             Container(
          //               width: size.width * 0.1,
          //               color: Colors.black12,
          //             )
          //           ],
          //         ),
          //       );
          //     },
          //     childCount: homepageController.lstDataOfComments.length,
          //   ),
          // ),

        ],
      ),
    ));
    // return Container(

    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: Container(
    //           //color: Colors.white,
    //            // height: size.height * 0.40,
    //            height: size.height,
    //             //color: Colors.amber.shade100,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(50),
    //                   bottomRight: Radius.circular(50)),
    //               color: Colors.black45,
    //               image: DecorationImage(
    //                   image: AssetImage('assets/images/sherlock.jpg'),
    //                   fit: BoxFit.cover),
    //             ),
    //         ),
    //       ),
    //       // Container(
    //       //   height: 50,
    //       //   color: Colors.deepOrange,
    //       // )
    //     ],
    //   ),
    // );
  }
}
 SliverList _getSlivers(List myList, BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return buildRow(myList[index],context,index);
        },
        childCount: myList.length,
      ),
    );
  }

  buildRow(Datum modelData,BuildContext _context,int index) {
    return  Container(
      height: 80,
      color: index%2==0 ? Colors.grey.shade100:Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color:Colors.red,
                          width: MediaQuery.of(_context).size.width* 0.2,
                          height: MediaQuery.of(_context).size.height*0.2,
                         // color: Colors.red,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/booklogo.png') ,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(_context).size.width * 0.7,
                            child: Text(modelData.explanation.toString()),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(_context).size.width * 0.1,
                          child: Icon(Icons.delete_rounded),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
    );

    
    
    // Padding(padding: const EdgeInsets.all(15.0),child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)));
  }

/*
 
Container(
                  height: 30,
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.2,
                        color: Colors.red,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/booklogo.png') ,
                        ),
                      ),
                      Container(
                        width: size.width * 0.7,
                        color: Colors.amber,
                      ),
                      Container(
                        width: size.width * 0.1,
                        color: Colors.black12,
                      )
                    ],
                  ),
                );

 */