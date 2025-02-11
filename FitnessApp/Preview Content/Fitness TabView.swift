//
//  Fitness TabView.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 10/02/25.
//

import SwiftUI

struct Fitness_TabView: View {
    @State var selectedTab  = "Home"
    
    init(){
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.stackedLayoutAppearance.selected.iconColor = .green
        apperance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        UITabBar.appearance().scrollEdgeAppearance = apperance
        
    }
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            HistoricDataView()
                .tag("Historic")
                .tabItem { Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Charts")
                }
        }
    }
}

#Preview {
    Fitness_TabView()
}
