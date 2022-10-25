import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _dropdownItems = [
    'Beginner',
    'Intermediate',
  ];

  String _selectedKategori = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/header.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          _buildContent(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildContent() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          // top: AppBar().preferredSize.height,
          top: MediaQuery.of(context).padding.top + 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 20, child: _buildTopSection()),
            const SizedBox(height: 28),
            _buildInformation(),
            const SizedBox(height: 25),
            _buildMilestones(),
            const SizedBox(height: 20),
            _buildGrid(),
            // const SizedBox(height: 20),
          ],
        ),
      );

  Widget _buildTopSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.chevron_left_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
      );

  Widget _buildInformation() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Spanish',
                    style: GoogleFonts.poppins(
                      color: const Color(0XFFF8F8F8),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: 155,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      iconSize: 36,
                      icon: Icon(
                        // Icons.chevron_left_outlined,
                        Icons.keyboard_arrow_down_outlined,
                        color: const Color(0XFFF6921E),
                      ),
                      dropdownColor: Colors.white,
                      items: _dropdownItems
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  e,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0XFFF6921E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: _selectedKategori,
                      onChanged: (String? value) {
                        setState(() => _selectedKategori = value!);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: _progresWidget(20)),
          ],
        ),
      );

  Widget _progresWidget(double value) {
    final innerLayout = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 6),
        // borderRadius: BorderRadius.circular(150),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${value.toStringAsFixed(0)}%',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(
            'Completed',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 11, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
    return innerLayout;
  }

  Widget _buildMilestones() => Row(
        children: <Widget>[
          Image.asset(
            'images/diamond.png',
            width: 17,
            height: 26,
          ),
          Image.asset(
            'images/diamond.png',
            width: 17,
            height: 26,
          ),
          const SizedBox(width: 7),
          Text(
            '2 Milestones',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
      );

  Widget _buildGrid() => Expanded(
        child: GridView.count(
          padding: const EdgeInsets.all(0),
          crossAxisCount: 2,
          children: const [
            MyCard(
              icon: 'images/basics.png',
              title: 'Family Members',
              subtitle: '4/5',
              input: 4,
              inputMax: 5,
              progressColor: Color(0XFFEDAF3E),
              backgroundColor: Colors.grey,
            ),
            MyCard(
              icon: 'images/occupations.png',
              title: 'Occupations',
              subtitle: '1/5',
              input: 1,
              inputMax: 5,
              progressColor: Color(0XFFFC3E58),
              backgroundColor: Colors.grey,
            ),
            MyCard(
              icon: 'images/conversation.png',
              title: 'Conversation',
              subtitle: '3/5',
              input: 3,
              inputMax: 5,
              progressColor: Color(0XFF348EB9),
              backgroundColor: Colors.grey,
            ),
            MyCard(
              icon: 'images/places.png',
              title: 'Places',
              subtitle: '1/5',
              input: 1,
              inputMax: 5,
              progressColor: Color(0XFF07C45B),
              backgroundColor: Colors.grey,
            ),
            MyCard(
              icon: 'images/family-members.png',
              title: 'Family Members',
              subtitle: '3/5',
              input: 3,
              inputMax: 5,
              progressColor: Color(0XFFAC3DEB),
              backgroundColor: Colors.grey,
            ),
            MyCard(
              icon: 'images/foods.png',
              title: 'Foods',
              subtitle: '2/5',
              input: 2,
              inputMax: 5,
              progressColor: Color(0XFF0350BF),
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      );
}
