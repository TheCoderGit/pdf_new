import 'package:permission_handler/permission_handler.dart';

/// Service that ensures the application has storage access permissions.
class StoragePermissionService {
  /// Checks if storage permission is granted. If not, it requests permission
  /// from the user. Returns `true` if permission is granted.
  Future<bool> checkAndRequest() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }

    status = await Permission.storage.request();
    if (status.isPermanentlyDenied) {
      // Optionally open app settings so the user can grant the permission.
      await openAppSettings();
      return false;
    }
    return status.isGranted;
  }
}
