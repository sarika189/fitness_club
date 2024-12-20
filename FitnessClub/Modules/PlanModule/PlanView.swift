import SwiftUI

struct Workout: Identifiable {
    let id = UUID()
    let date: Date
    let plan: String
    let reminder: String
}

struct PlanView: View {
    @State private var selectedDate = Date()
    @State private var workoutPlan = ""
    @State private var reminder = ""
    @State private var workouts: [Workout] = []

    var body: some View {
        VStack {
            Text("Plan Your Workout")
                .font(.title3)
                .padding()

            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()

            TextField("Workout Plan", text: $workoutPlan)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Set Reminder", text: $reminder)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                saveWorkoutPlan()
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            List(workouts) { workout in
                VStack(alignment: .leading) {
                    Text(workout.plan)
                        .font(.headline)
                    Text("Reminder: \(workout.reminder)")
                        .font(.subheadline)
                    Text("Date: \(formattedDate(workout.date))")
                        .font(.subheadline)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }

    func saveWorkoutPlan() {
        let newWorkout = Workout(date: selectedDate, plan: workoutPlan, reminder: reminder)
        workouts.append(newWorkout)
        workoutPlan = ""
        reminder = ""
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
