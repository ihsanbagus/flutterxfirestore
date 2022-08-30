import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final db = FirebaseFirestore.instance;
  var data = [].obs;

  Future<void> getData() async {
    // REALTIME GET DATA
    db
        .collection("users")
        .snapshots(includeMetadataChanges: true)
        .listen((event) {
      // includeMetadataChanges: true is for realtime update
      data.value = event.docs;
    });

    // ONE TIME GET DATA
    // await db.collection("users").get().then((event) {
    //   data.clear();
    //   data.addAll(event.docs);
    //   for (var doc in event.docs) {
    //     log("${doc.id} => ${doc.data()}");
    //   }
    // });
  }

  void deleteData(var id) {
    db.collection("users").doc(id).delete();
  }
}
