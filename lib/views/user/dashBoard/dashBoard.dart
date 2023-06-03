import 'package:eunoia/views/user/profilePage/profilePage.dart';
import 'package:eunoia/utils/movieRecommandation.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var recommendedMovies = [];
  var recommendedMusic = [];

  bool loadingData = true;

  Future<void> getRecommandedMovies() async {
    var data = await MovieRecommandation.getDepressionMovies();
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

  @override
  void initState() {
    super.initState();
    getRecommandedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dashboard'),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar(
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
                margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
                    child: const Text('FirstName LastName'),
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
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Moderate',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
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
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Severe',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
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
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Mild',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]))),

          const SizedBox(height: 16),

          //container for movie recommandation
          const Text('Recommanded movies'),
          Container(
            child: loadingData
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                    ),
                  )
                : SingleChildScrollView(
                    child: Row(children: [
                      //card - 1
                      Card(
                        child: Column(
                          children: [
                            //Display poster image
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${recommendedMovies[1]['poster_path']}',
                              ),
                            ),
                            Text(
                              recommendedMovies[1]['title'],
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      //Card - 2
                      Card(
                        child: Column(
                          children: [
                            //Display poster image
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${recommendedMovies[2]['poster_path']}',
                              ),
                            ),
                            Text(
                              recommendedMovies[2]['title'],
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
          ),
        ],
      ),
    );
  }
}
