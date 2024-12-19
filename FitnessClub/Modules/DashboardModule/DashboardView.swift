import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // Plan view
            PlanView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Plan")
                }
                .tag(0)

            // Heart (Calories) view
            HeartView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Calories")
                }
                .tag(1)

            // Workouts view
            WorkoutsView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workouts")
                }
                .tag(2)

            // Profile view
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)

            // Preferences view
            PreferencesView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Preferences")
                }
                .tag(4)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PlanView: View {
    var body: some View {
        Text("Plan Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct HeartView: View {
    var body: some View {
        Text("Calories Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct WorkoutsView: View {
    var body: some View {
        Text("Workouts Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
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
        DashboardView()
    }
}

