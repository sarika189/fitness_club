import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    
    @ObservedObject
    var presenter: WorkoutPresenter
    let apiService = ExerciseService()
    var body: some View {
        VStack{
            TopBarView().frame(height: 40)
            TabView(selection: $selectedTab) {
                ForEach(DashboardTab.allCases, id: \.self) { tab in
                    tab.destinationView(presenter: presenter, apiService: apiService).tabItem {
                        Image(systemName:tab.icon)
                            .foregroundColor(Color("ThemeColor"))
                        Text(tab.title)
                            .foregroundColor(Color("ThemeColor"))
                    }.tag(tab.rawValue)
                }
            }
            .accentColor(Color("ThemeColor"))
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Text("Fitness Club")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "person.crop.circle")
                .font(.title)
                .padding()
                .foregroundColor(.white)
        }
        .padding()
        .background(Color("ThemeColor"))
    }
}

enum DashboardTab: Int, CaseIterable {
    case calendar, health,workouts, profile,preferences
    
    var title: String {
        switch self {
        case .calendar: return "Plan"
        case .health: return "Health"
        case .workouts: return "Workouts"
        case .profile: return "Profile"
        case .preferences: return "Preferences"
        }
    }
    
    var icon: String {
        switch self {
        case .calendar: return "calendar"
        case .health: return "heart"
        case .workouts: return "figure.step.training"
        case .profile: return "person.crop.circle"
        case .preferences: return "gear"
        }
    }
    
    @ViewBuilder
    func destinationView(presenter: WorkoutPresenter, apiService: ExerciseService) -> some View{
        switch self {
            case .profile: ProfileView(presenter: presenter)
            case .workouts: WorkoutsView(presenter: presenter, apiService: apiService)
            case .calendar: PlanView()
            case .health: HealthView()
            case .preferences: PreferencesView()
        }
    }
    
    var iconColor: Color {
        switch self {
            case .profile: return .blue
            case .workouts: return .orange
            case .calendar: return .purple
            case .health: return .red
            case .preferences: return .gray
        }
    }
    
}

struct HealthView: View {
    var body: some View {
        Text("Calories Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct PreferencesView: View {
    var body: some View {
        Text("Preferences Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let workoutPresenter = WorkoutPresenter()
        DashboardView(presenter: workoutPresenter)
    }
}

