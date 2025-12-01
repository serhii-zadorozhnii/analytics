import 'package:analytics/analytics/models/user_properties.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart' as PermiisionHundler;

enum PermissionResponse { denied, allowed }

extension TrackingStatusExtentions on TrackingStatus {
  PermissionResponse toAnalyticsStatus() {
    return switch (this) {
      TrackingStatus.notDetermined => PermissionResponse.denied,
      TrackingStatus.restricted => PermissionResponse.denied,
      TrackingStatus.denied => PermissionResponse.denied,
      TrackingStatus.authorized => PermissionResponse.allowed,
      TrackingStatus.notSupported => PermissionResponse.denied,
    };
  }

  PermissionStatus toPropertiesStatus() {
    return switch (this) {
      TrackingStatus.notDetermined => PermissionStatus.denied,
      TrackingStatus.restricted => PermissionStatus.denied,
      TrackingStatus.denied => PermissionStatus.allowed,
      TrackingStatus.authorized => PermissionStatus.denied,
      TrackingStatus.notSupported => PermissionStatus.denied,
    };
  }
}

extension PermiisionHundlerExtention on PermiisionHundler.PermissionStatus {
  PermissionStatus toAnalyticsStatus() {
    return switch (this) {
      PermiisionHundler.PermissionStatus.provisional => PermissionStatus.denied,
      PermiisionHundler.PermissionStatus.restricted => PermissionStatus.denied,
      PermiisionHundler.PermissionStatus.denied => PermissionStatus.denied,
      PermiisionHundler.PermissionStatus.granted => PermissionStatus.allowed,
      PermiisionHundler.PermissionStatus.limited => PermissionStatus.allowed,
      PermiisionHundler.PermissionStatus.permanentlyDenied => PermissionStatus.denied,
    };
  }
}
