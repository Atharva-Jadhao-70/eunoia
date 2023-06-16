import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eunoia/views/user/musicRecommandation/musicRecommandation.dart';
import 'package:eunoia/views/user/profilePage/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:eunoia/views/user/userLogin/login.dart';

import '../../../utils/movieRecommandation.dart';
import '../movieRecommandation/movieRecommandation.dart';


class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var recommendedMovies = [];

  static String? userFullName;
  static String? userEmail;
  static String? userPhonerNumber;
  static String? userDOB;
  static String? userDepressionLevel;
  static String? userAnxietyLevel;
  static String? userStressLevel;

  bool loadingData = true;

  Future<void> getRecommandedMovies() async {
    var data = await MovieRecommandationAPI.getDepressionMovies();
    if (data != null) {
      setState(() {
        recommendedMovies = data;
        loadingData = false;
      });
    }
    print(recommendedMovies);
  }

  void loadData() async {
    setState(() {
      loadingData = true;
    });
    // Code to fetch data
    setState(() {
      loadingData = false;
    });
  }

  Future<void> fetchUserData() async {
    final DocumentSnapshot userSnapshot =
        await firestore.collection('users').doc(LoginPageState.userId).get();

    final userData = userSnapshot.data() as Map<String, dynamic>;

    setState(() {
      userFullName = userData['userName'];
      userEmail = userData['userEmail'];
      userDepressionLevel = userData['userDepressionLevel'];
      userAnxietyLevel = userData['userAnxietyLevel'];
      userStressLevel = userData['userStressLevel'];
      userDOB = userData['userDateOfBirth'].toString();
      userPhonerNumber = userData['userPhoneNumber'];
    });
  }

  @override
  void initState() {
    super.initState();
    getRecommandedMovies();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dashboard'),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Container for header result
          Container(
              child: Card(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  elevation: 5,
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.1,
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(userFullName ?? '----'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Depression Level',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userDepressionLevel ?? '----',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Anxiety Level',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userAnxietyLevel ?? '----',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Stress Level',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userStressLevel ?? '----',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]))),

          const SizedBox(height: 16),

          //container for music recommandation
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Music Recommandation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              // height: 200,
              child: Row(
            children: [
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MusicRecommandation(query: 'depression')));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Music for depression',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MusicRecommandation(query: 'anxiety')));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Music for anxiety',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MusicRecommandation(query: 'stress')));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Music for stress',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          )),

          //container for movie recommandation
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieRecommandation()));
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Center(child: Text('Movie Recommandation', style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width * 0.05),)),
              ),
            ),
          ),

          // const Padding(
          //   padding: EdgeInsets.all(5),
          //   child: Text(
          //     'Movies Recommandation',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Container(
          //   child: loadingData
          //       ? const Center(
          //           child: CircularProgressIndicator(
          //             strokeWidth: 4.0,
          //           ),
          //         )
          //       : SingleChildScrollView(
          //           child: Row(children: [
          //             //card - 1
          //             Card(
          //               child: Column(
          //                 children: [
          //                   //Display poster image
          //                   Container(
          //                     width: 100,
          //                     height: 100,
          //                     child: Image.network(
          //                       'https://image.tmdb.org/t/p/w500${recommendedMovies[1]['poster_path']}',
          //                     ),
          //                   ),
          //                   Text(
          //                     recommendedMovies[1]['title'],
          //                     textAlign: TextAlign.center,
          //                   )
          //                 ],
          //               ),
          //             ),
          //             //Card - 2
          //             Card(
          //               child: Column(
          //                 children: [
          //                   //Display poster image
          //                   Container(
          //                     width: 100,
          //                     height: 100,
          //                     child: Image.network(
          //                       'https://image.tmdb.org/t/p/w500${recommendedMovies[2]['poster_path']}',
          //                     ),
          //                   ),
          //                   Text(
          //                     recommendedMovies[2]['title'],
          //                     textAlign: TextAlign.center,
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ]),
          //         ),
          // ),
        ],
      ),
    );
  }
}
