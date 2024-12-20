import Foundation

protocol WorkoutPresenterProtocol: ObservableObject{
    var muscle: MuscleTypes { get set }

}

class WorkoutPresenter: WorkoutPresenterProtocol{
    
    @Published
    var muscle: MuscleTypes = .Abdominals
    
}
