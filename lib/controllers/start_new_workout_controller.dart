import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heronfit/models/exercise_model.dart';
import 'package:heronfit/models/workout_model.dart';
import 'package:heronfit/models/set_data_model.dart';

class StartNewWorkoutController {
  Workout? workout;
  String workoutName = '';
  String workoutNotes = '';
  List<Exercise> exercises = [];
  int duration = 0;
  late Timer _timer;

  StartNewWorkoutController({required this.workout});

  void setWorkoutName(String name) {
    workoutName = name;
  }

  void setWorkoutNotes(String notes) {
    workoutNotes = notes;
  }

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
  }

  void addSet(Exercise exercise) {
    exercise.sets.add(SetData(kg: 0, reps: 0, completed: false));
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration++;
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
  }
}