import Foundation

struct Muscle: Identifiable {
    let id = UUID()
    let name: MuscleTypes
}

enum MuscleTypes : String, CaseIterable{
    case Abdominals
    case Abductors
    case Biceps
    case Calves
    case Chest
    case Forearms
    case Glutes
    case Hamstrings
    case Lats
    case LowerBack
    case MiddleBack
    case Neck
    case Quadriceps
    case Traps
    case Triceps
}
