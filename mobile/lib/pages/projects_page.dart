import 'package:flutter/material.dart';
import 'package:mobile/widgets/common/app_bar.dart';

class ProjectsPage extends StatefulWidget {
  final String token;
  const ProjectsPage({Key? key, required this.token}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Text(widget.token),
    );
  }
}
