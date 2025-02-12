//
//  ActivityCard.swift
//  FitnessApp
//
//  Created by Thanveer ahmed Shaik on 11/02/25.
//

import SwiftUI





struct ActivityCard: View {
    @State var activity:Activity
    
    
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(15)  //round up the edges
            
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading , spacing: 8){
                        Text(activity.title)
                        
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                    
                }
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
                
            }
            .padding()
            
        }
    }
}



#Preview {
    ActivityCard(activity: Activity(id: 0, title: "Steps today", subtitle: "Goal 12000", image: "figure.walk", tintColor: .green, amount: "9812"))
}
