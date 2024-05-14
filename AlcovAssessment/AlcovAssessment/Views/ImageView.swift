//
//  ImageView.swift
//  AlcovAssessment
//
//  Created by Kate Murray on 5/14/24.
//

import SwiftUI
// changes fonts later

struct ImageView: View {
    @State private var hasSelection = false
    @State private var selection: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var vm = UserSelectionViewModel()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Button(action: {
                            presentationMode.wrappedValue
                                .dismiss()
                        },label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(Color("Button-On"))
                        })
                        .navigationBarBackButtonHidden(true)
                    }
                    Text("1 of 5")
                        .fontWeight(.bold)
                }
                .padding(.bottom, 20)
                Text("Tell me about your Alcov! Which room would you like to get started with?")
                    .fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 10)
                Text("You'll be able to switch between rooms later")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 30)
                HStack{
                    Button(action: {
                        selection = "bed"
                        if hasSelection == false {
                            vm.addUser(user: User(selection: selection))
                        } else{
                            vm.updateUser(user: User(selection: selection))
                        }
                        hasSelection = true
                        }, label: {TypeView(type: "Bedroom", image: "bed.double", selection: selection == "bed")})
                    Button(action: {
                        selection = "living-space"
                        if hasSelection == false{
                            vm.addUser(user: User(selection: selection))
                        } else {
                            vm.updateUser(user: User(selection: selection))
                        }
                        hasSelection = true
                    }, label: {TypeView(type: "Living Space", image: "chair.lounge", selection: selection == "living-space")})
                    Button(action: {
                        selection = "workspace"
                        if hasSelection == false{
                            vm.addUser(user: User(selection: selection))
                        } else {
                            vm.updateUser(user: User(selection: selection))
                        }
                        hasSelection = true
                    }, label: {TypeView(type: "Workspace", image: "laptopcomputer", selection: selection == "workspace")})
                }
                Spacer()
                Button(action: {print("I'll do this later")},
                       label: {
                    Text("I'll do this later")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding()
                })
                Button(action: {},
                       label: {
                    if (!hasSelection){
                        Text("Next")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .padding()
                            .padding(.horizontal, 120)
                            .background(Color("Button-Disabled"))
                            .cornerRadius(30)
                    }
                    else {
                        Text("Next")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .padding()
                            .padding(.horizontal, 120)
                            .background(Color("Button-On"))
                            .cornerRadius(30)
                    }
                })
                .disabled(hasSelection == false)
            }
        }
    }
}

struct TypeView: View {
    var type: String
    var image: String
    var selection: Bool
    
    var body: some View{
        if selection == false{
                    VStack{
                        Image(systemName: image).foregroundColor(Color("AccentBlue"))
                            .font(.largeTitle)
                            .padding()
                        Text(type)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .frame(width: 90, height: 120)
                    .padding()
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                }
    
        else {
            VStack{
                
                        Image(systemName: image).foregroundColor(Color("AccentBlue"))
                            .font(.largeTitle)
                            .padding()
                        Text(type)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .frame(width: 90, height: 120)
                    .padding()
                    .background(Color("Blue2"))                 .cornerRadius(30)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("AccentBlue"), lineWidth: 3))
                    
        }
    
    }
}

#Preview {
    ImageView()
}
