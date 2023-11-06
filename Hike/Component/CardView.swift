//
//  CardView.swift
//  Hike
//
//  Created by Nilam Shah on 05/11/23.
//

import SwiftUI

struct CardView: View {
    // MARK: Properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: Functions
    func randomImage() {
        print("--- Button Pressed ---")
        print("Old image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Random number generated = \(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        
        print("New image number = \(imageNumber)")
        print("--- End Result ---")
        print("\n")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            //Show a sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    // MARK: Main content
                    Text("Fun and enjoyanle outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(randomNumber)")
                        .resizable()
                    .scaledToFit()
                    //Value: Everytime randomNumber value changes triggers this animation
                    .animation(.easeOut(duration: 3), value: randomNumber)
                }
                
                // MARK: Footer
                Button {
                    //Action: Generate a random number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
