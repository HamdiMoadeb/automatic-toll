
import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/enums/update_user.dart';
import 'package:tollxpress/core/usecase/usecase.dart';
import 'package:tollxpress/core/utils/typedef.dart';
import 'package:tollxpress/feature/auth/domain/repositories/auth_repo.dart';

class UpdateUser extends UseCase<void, UpdateUserParams> {
  final AuthRepo authRepo;

  const UpdateUser(this.authRepo);

  @override
  ResultFuture<void> call(UpdateUserParams params) => authRepo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  final dynamic userData;
  final UpdateUserAction action;

  const UpdateUserParams({
    required this.userData,
    required this.action,
  });

  const UpdateUserParams.empty()
      : this(
          action: UpdateUserAction.displayName,
          userData: '',
        );

  @override
  List<Object> get props => [userData, action];
}
