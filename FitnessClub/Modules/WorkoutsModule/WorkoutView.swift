
import Foundation
import SwiftUI

struct WorkoutsView: View {
    
    @ObservedObject
    var presenter: WorkoutPresenter
    private let apiService: ExerciseService
    
    init(presenter: WorkoutPresenter, apiService: ExerciseService) {
        self.presenter = presenter
        self.apiService = apiService
    }
    
    var body: some View {
        NavigationView {
            List(MuscleTypes.allCases, id: \.self) { muscle in
                HStack {
                    Text(muscle.rawValue.capitalized)
                    Spacer()
                    NavigationLink(destination: MuscleDetailsView(presenter: .init(interactor: MuscleDetailInteractor(apiService: apiService), muscle: muscle))) {
                        Image(systemName: "figure.strengthtraining.traditional")
                        .foregroundColor(Color("ThemeColor")) } }
                .navigationTitle("Workout Muscles") }
        }
    }
}
