//
//  RoomView.swift
//  AlcovAssessment
//
//  Created by Kate Murray on 5/14/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RoomView: View {
    let image = URL(string: "https://images.urbndata.com/is/image/UrbanOutfitters/49762438_001_b?$xlarge$&fit=constrain&fmt=webp&qlt=80&wid=1314")!
    var body: some View {
        
        NavigationStack{
            VStack{
                WebImage(url: image)
                    .frame(width: 300, height: 500)
                    
                    .cornerRadius(30)
                    .padding(.bottom, 30)
                    
                
                
                NavigationLink(destination: ImageView()){
                    Text("Next")
                        .font(.title)
                        .padding()
                        .padding(.horizontal, 60)
                        .background(Color("Button-Disabled"))
                        .foregroundStyle(.black)
                        .cornerRadius(15)
                        .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("Button-On"), lineWidth: 3))
                }
            }
            }
        }
    }


#Preview {
    RoomView()
}
