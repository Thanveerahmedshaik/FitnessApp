//
//  HomeView.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 10/02/25.
//

import SwiftUI




struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
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
    
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    //This is for ProgressBars for calorie stepcount and standcount
                    HStack{
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8){
                            VStack(alignment: .leading, spacing: 8){
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("123 kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("52 mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("8 hrs")
                                    .bold()
                            }
                        }
                        .alignmentGuide(.leading) { _ in 0 } // Ensuring alignment consistency
                        Spacer()
                        //This is for the progress bar
                        
                        ZStack{
                            ProgressCircleView(progress: $calories, goal: 600, color: .red)
                            
                            ProgressCircleView(progress: $active, goal: 60, color: .green)
                                .padding(.all,20)
                            ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                                .padding(.all,40)
                            
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    
                    
                    HStack{
                        Text("Fitness Activity")
                            .font(.title2)
                        
                        Spacer()
                        
                        Button{
                            print("show more")
                        }label: {
                            Text("show more")
                                .padding(.all,10)      // change the padding size as it is big in general
                                .foregroundColor(.white)  // changes text color to white
                                .background(.blue)      // for the background of the button
                                .cornerRadius(20)    //To round the edges of the button
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                        
                        
                        
                        
                        
                   
                    //Here i am using a lazyvgrid because i want to  optimize the performance when they render all a
                    //at once
                    LazyVGrid(columns: Array(repeating: GridItem(spacing:20), count: 2)) {
                        ForEach(mockActivities,id:\.id) { activity in
                           ActivityCard(activity: activity)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Recent Workouts")
                            .font(.title2)
                        
                        Spacer()
                       //NavigationLink helps to navigate to a screen with a list of all workouts
                        
                        NavigationLink{
                            EmptyView()
                        }label: {
                            Text("show more")
                                .padding(.all,10)      // change the padding size as it is big in general
                                .foregroundColor(.white)  // changes text color to white
                                .background(.blue)      // for the background of the button
                                .cornerRadius(20)    //To round the edges of the button
                        }
                        
                    }
                    .padding(.horizontal)
                    

                    //LazyVStack works similiar to LazyVGrid except its not a grid its a stack so everything is being stacked vertically and the data is loading lazily
                    // Recent workout section
                    LazyVStack{
                        ForEach(mockWorkouts,id:\.id) { workout in
                            WorkoutCard(workout: workout)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    }
            }
        }
        }
    }


#Preview {
    HomeView()
}
