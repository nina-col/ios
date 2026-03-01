

import SwiftUI

struct RootView: View {
    
    @State private var showDashboard = false
    
    var body: some View {
        DashboardView()

        /*if showDashboard {
            DashboardView()
        } else {
            HomePageView {
                showDashboard = true
            }
        } */
    }
}
