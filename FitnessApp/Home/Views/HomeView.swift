//
//  HomeView.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 10/02/25.
//

import SwiftUI



struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()  //We make sure that we add the statobject wrapper to the viewmodel nthat way our view knows that its holding an instance of the observable object(viewModel)
    
    
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
                        
                        VStack(alignment:.leading){
                            VStack(alignment: .leading, spacing: 8){
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("\(viewModel.calories)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("\(viewModel.active)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment:.leading){
                                VStack(alignment: .leading, spacing: 7){
                                    Text("Stand")
                                        .font(.callout)
                                        .bold()
                                        .foregroundColor(.blue)
                                    
                                    Text("\(viewModel.stand)")
                                        .bold()
                                }
                            }
                        }
                        .alignmentGuide(.leading) { _ in 0 } // Ensuring alignment consistency
                        Spacer()
                        //This is for the progress bar
                        
                        ZStack{
                            ProgressCircleView(progress: $viewModel.calories, goal: 600, color: .red)
                            
                            ProgressCircleView(progress: $viewModel.active, goal: 60, color: .green)
                                .padding(.all,20)
                            ProgressCircleView(progress: $viewModel.stand, goal: 12, color: .blue)
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
                        ForEach(viewModel.mockActivities,id:\.id) { activity in
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
                        ForEach(viewModel.mockWorkouts,id:\.id) { workout in
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
    HomeView(viewModel: HomeViewModel())
}
