//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 11/02/25.
//

import SwiftUI


struct WorkoutCard: View {
    @State var workout: Workout
    var body: some View {
        
        
        HStack{
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width:48, height: 48)
                .foregroundColor(workout.tintcolor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing: 16){
                HStack{
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                    
                }
                HStack{
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", tintcolor: .cyan, duration: "51 mins", date: "Feb 11", calories: "512 kcal"))
}
