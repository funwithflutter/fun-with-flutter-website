import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth/user.dart';
import '../../domain/core/value_objects.dart';

extension FirebaseUserDomainX on FirebaseUser {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
