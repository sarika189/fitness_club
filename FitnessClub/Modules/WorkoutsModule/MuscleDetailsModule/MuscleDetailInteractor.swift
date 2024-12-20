import Foundation
import Combine

class MuscleDetailInteractor {
    private let apiService: ExerciseService
    private var cancellables = Set<AnyCancellable>()

    init(apiService: ExerciseService) {
        self.apiService = apiService
    }

    func fetchWorkoutDetails(for muscle: MuscleTypes, completion: @escaping ([MuscleDetailModel]) -> Void) {
        apiService.fetchWorkoutDetails(for: muscle)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completionStatus in
                if case .failure(let error) = completionStatus {
                    print("Error fetching workout details: \(error)")
                    completion([])
                }
            }, receiveValue: { details in
                completion(details)
            })
            .store(in: &cancellables)
    }
}
