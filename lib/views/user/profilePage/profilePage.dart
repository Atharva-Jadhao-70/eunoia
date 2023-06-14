import 'package:eunoia/views/user/dashBoard/dashBoard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/default_profile_photo.jpg'), // Replace with your own image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20.0,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        // Handle edit profile photo functionality
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),

          //name
          Container(
            child: Column(
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 5,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${DashboardScreenState.userFullName}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //email
          Container(
            child: Column(
              children: [
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 5,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${DashboardScreenState.userEmail}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //phone number
          Container(
            child: Column(
              children: [
                const Text(
                  'Phone number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 5,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '9786562672',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //Date of birth
          Container(
            child: Column(
              children: [
                const Text(
                  'Date of birth',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 5,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '29 Feb 2001',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),

          //depression level
          Card(
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Depression Level',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '${DashboardScreenState.userDepressionLevel}',
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ],
                ),
              )),
            ),
          ),

          Row(
            children: [
              //anxiety level
              Expanded(
                child: Card(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Anxiety Level',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            '${DashboardScreenState.userAnxietyLevel}',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),

              //stress level
              Expanded(
                child: Card(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Stress Level',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            '${DashboardScreenState.userStressLevel}',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
