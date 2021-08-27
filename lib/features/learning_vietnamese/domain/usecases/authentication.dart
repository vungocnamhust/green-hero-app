import 'package:learning_vietnamese/core/usecase/usecase.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/repositories/user_repository.dart';

class Authentication implements Usecase {
  final UserRepository userRepository;

  Authentication({
    this.userRepository,
  });
}
