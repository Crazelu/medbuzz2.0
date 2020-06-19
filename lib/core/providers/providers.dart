import 'package:MedBuzz/ui/views/fitness_reminders/all_fitness_reminders_model.dart';
import 'package:provider/provider.dart';

//Add your view models in this widget

final providers = <SingleChildCloneableWidget>[
  ChangeNotifierProvider(create: (_) => FitnessSchedulesModel())
];