//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 12/02/25.
//

import Foundation
class HomeViewModel: ObservableObject{
    
    
    var calories: Int = 123
    var active: Int = 52
    var stand: Int = 8
    
    
    var mockActivities = [
     Activity(id: 0, title: "Steps today", subtitle: "Goal 12000", image: "figure.walk", tintColor: .green, amount: "9812"),
     Activity(id: 1, title: "Steps today", subtitle: "Goal 1000", image: "figure.walk", tintColor: .red, amount: "612"),
     Activity(id: 2, title: "Steps today", subtitle: "Goal 12000", image: "figure.walk", tintColor: .blue, amount: "9812"),
     Activity(id: 3, title: "Steps today", subtitle: "Goal 50000", image: "figure.run", tintColor: .purple, amount: "59812")
    
    
    
    ]
     
     var mockWorkouts = [
         Workout(id: 0, title: "Running", image: "figure.run", tintcolor: .cyan, duration: "51 mins", date: "Feb 11", calories: "512 kcal"),
         Workout(id: 1, title: "Strength Training", image: "figure.strengthtraining.traditional", tintcolor: .red, duration: "51 mins", date: "Feb 11", calories: "512 kcal"),
         Workout(id: 2, title: "Running", image: "figure.run", tintcolor: .purple, duration: "51 mins", date: "Feb 11", calories: "512 kcal"),
         Workout(id: 3, title: "Running", image: "figure.run", tintcolor: .cyan, duration: "51 mins", date: "Feb 11", calories: "512 kcal")
     
     ]
}
