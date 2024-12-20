import SwiftUI

struct ProfileView: View {
    
    @ObservedObject
    var presenter: WorkoutPresenter
    let apiService = ExerciseService()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(DashboardTab.allCases, id: \.self) { section in
                    Section(header: Text(section.title)) {
                        NavigationLink(destination: section.destinationView(presenter: presenter, apiService: apiService)) {
                            HStack {
                                Image(systemName: section.icon)
                                    .foregroundColor(section.iconColor)
                                Text(section.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .listStyle(GroupedListStyle())
        }
    }
}
    
    
    struct ProfileDetailView: View {
        var body: some View {
            Text("Profile Details")
                .navigationTitle("Profile")
        }
    }
