

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planty/screens/Registration/model/user_model.dart';

CollectionReference<UserModel>getUserCollectionsWithConvert() {
  return FirebaseFirestore.instance
      .collection(UserModel.collectionName)
      .withConverter<UserModel>(
    fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
    toFirestore: (userModel, _) => userModel.toJson(),
  );
}
