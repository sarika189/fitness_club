import Foundation
import SwiftUI

struct MuscleDetailRouter {
    static func createModule(muscle: MuscleTypes) -> some View {
        let apiService = ExerciseService()
        let interactor = MuscleDetailInteractor(apiService: apiService)
        let presenter = MuscleDetailPresenter(interactor: interactor, muscle: muscle)
        let view = MuscleDetailsView(presenter: presenter)
        return view
    }
}

