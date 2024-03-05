import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class Managerment extends StatefulWidget {
  const Managerment({super.key});

  @override
  State<Managerment> createState() => _ManagermentState();
}

class NhanVien {
  String maStaff, tenStaff, sdtStaff;
  NhanVien(this.maStaff, this.tenStaff, this.sdtStaff);
}

class _ManagermentState extends State<Managerment> {
  final TextEditingController _maStaffController = TextEditingController();
  final TextEditingController _tenStaffController = TextEditingController();
  final TextEditingController _sdtStaffController = TextEditingController();
  List<NhanVien> listNhanVien = <NhanVien>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Staff Managerment",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "STAFF INFORMATION",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: _maStaffController,
                decoration: const InputDecoration(
                    labelText: 'Mã:',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    alignLabelWithHint: true,
                    hoverColor: Colors.blue),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: _tenStaffController,
                decoration: const InputDecoration(
                    labelText: 'Tên:',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    alignLabelWithHint: true,
                    hoverColor: Colors.blue),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: _sdtStaffController,
                decoration: const InputDecoration(
                    labelText: 'SĐT:',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    alignLabelWithHint: true,
                    hoverColor: Colors.blue),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_maStaffController.text.isNotEmpty &&
                        _tenStaffController.text.isNotEmpty &&
                        _sdtStaffController.text.isNotEmpty) {
                      NhanVien staff = NhanVien(_maStaffController.text,
                          _tenStaffController.text, _sdtStaffController.text);
                      bool exists = false;
                      for (var i = 0; i < listNhanVien.length; i++) {
                        if (listNhanVien[i].maStaff == staff.maStaff) {
                          exists = true;
                          break;
                        }
                      }
                      if (!exists) {
                        listNhanVien.add(staff);
                      } else {
                        Fluttertoast.showToast(
                          msg: "This Staff already existed.",
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please fill in the information ",
                      );
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: double.infinity,
                  child: const Text('Lưu'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: listNhanVien.isNotEmpty
                    ? ListView.builder(
                        itemCount: listNhanVien.length,
                        itemBuilder: (context, index) {
                          return StaffContent(
                            nv: listNhanVien[index],
                          );
                        },
                      )
                    : const Center(
                        child: Text("No item available"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaffContent extends StatelessWidget {
  const StaffContent({super.key, required this.nv});
  final NhanVien nv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Mã NV',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      nv.maStaff,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(nv.tenStaff,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(nv.sdtStaff,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
