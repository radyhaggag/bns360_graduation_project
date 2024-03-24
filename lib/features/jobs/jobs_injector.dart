import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';

import '../../config/injector_container.dart';

initJobs() {
  sl.registerFactory(
    () => JobsBloc(),
  );
}
