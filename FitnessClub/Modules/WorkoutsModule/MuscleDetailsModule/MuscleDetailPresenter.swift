import Foundation
import Combine

class MuscleDetailPresenter: ObservableObject {
    private let interactor: MuscleDetailInteractor
     let muscle: MuscleTypes

    @Published var workoutDetails: [MuscleDetailModel] = []

    init(interactor: MuscleDetailInteractor, muscle: MuscleTypes) {
        self.interactor = interactor
        self.muscle = muscle
        loadWorkoutDetails(for: muscle)
    }

    func loadWorkoutDetails(for muscle: MuscleTypes) {
        interactor.fetchWorkoutDetails(for: muscle) { [weak self] details in
            self?.workoutDetails = details
        }
    }
}
