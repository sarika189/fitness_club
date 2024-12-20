import Foundation

struct MuscleDetailModel: Codable, Identifiable, Equatable, Hashable{
    var id = UUID()
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}
