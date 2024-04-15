part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.todo() = Todo;
  const factory DashboardEvent.getData() = DashboardEventGetData;
  const factory DashboardEvent.createData() = DashboardEventCreateData;
}
