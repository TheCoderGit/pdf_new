import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/storage_permission_service.dart';

/// Provides a [StoragePermissionService] instance.
final storagePermissionServiceProvider = Provider<StoragePermissionService>((ref) {
  return StoragePermissionService();
});

/// Future provider that checks and requests storage permissions.
final storagePermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(storagePermissionServiceProvider);
  return service.checkAndRequest();
});
