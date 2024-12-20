import Foundation
import SwiftUI

// View
struct MuscleDetailsView: View {
    @ObservedObject var presenter: MuscleDetailPresenter

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    Text(presenter.muscle.rawValue.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Image(systemName: "figure.walk.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(12)
                .padding()

                // Details
                ForEach(presenter.workoutDetails) { detail in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(detail.name)
                            .font(.headline)
                            .foregroundColor(.white)
                        HStack {
                            Text("Type: \(detail.type)")
                            Text("Equipment: \(detail.equipment)")
                            Text("Difficulty: \(detail.difficulty.capitalized)")
                        }
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }

                // Instructions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(presenter.workoutDetails.first?.instructions ?? "")
                        .foregroundColor(.white)
                        .padding(.top, 4)
                }
                .padding()
                .background(Color.blue.opacity(0.8))
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .background(Color("ThemeColor"))
        .navigationTitle(presenter.muscle.rawValue.capitalized)
        .onAppear {
            presenter.loadWorkoutDetails(for: MuscleTypes(rawValue: presenter.muscle.rawValue.capitalized) ?? .Abdominals)
        }
    }
}

