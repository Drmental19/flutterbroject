import 'package:demo_page/pallete.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ProjectItems extends StatefulWidget {
  const ProjectItems({super.key});

  @override
  State<ProjectItems> createState() => _ProjectItemsState();
}

class _ProjectItemsState extends State<ProjectItems> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70.0,
              width: double.infinity,
              color: Pallete.backgroundColor,
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/HexoGrp.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Implement search logic here
                  // You may filter your listProjects based on the search value
                  setState(() {
                    // Update the UI based on search results if needed
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: ' . . .',
                  prefixIcon: const Icon(Icons.search, color: Colors.white38),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Pallete.borderColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              ),
            ),
            SizedBox(
              height: 1000,
              child: Column(
                children: List.generate(listProjects.length, (index) {
                  return Row(children: [
                    Expanded(
                      child: SwitchListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            listProjects[index].nameProject.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        value: listProjects[index].state,
                        activeTrackColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            listProjects[index].state = value;
                            UpdateStatus(value, listProjects[index].id);
                          });
                        },
                      ),
                    )
                  ]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
