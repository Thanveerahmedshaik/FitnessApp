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
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
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
                .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
