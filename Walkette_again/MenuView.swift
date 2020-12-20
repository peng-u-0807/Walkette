//
//  MenuView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    NavigationLink(destination: MainView()){
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22.0)
                            .foregroundColor(.black)
                    }

                    Spacer()
                    Text("Menu")
                        .fontWeight(.semibold)
                        .font(.title3)
                    Spacer()
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 22.0)
                        .foregroundColor(.black)
                        .opacity(0)
                }.padding(.horizontal, 30.0)
                .padding(.top, 65.0)
                .padding(.bottom, 40.0)
                
                menuDetailView()
                
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }.background(Image("innerBackground"))
        .edgesIgnoringSafeArea(.all)
    }
}


struct menuDetailView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(Color.white)
                    .frame(width: 382, height: 97)
                    .shadow(color: shadowcolor, radius: 6, x: 0.0, y: 3.0)
                VStack {
                    Text("Change Color")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.title2)
                        .padding(.trailing, 185.0)
                    Text("Paint the world with your route.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.trailing, 105.0)
                }
                
                HStack {
                    NavigationLink(destination: MainView()){
                        Spacer()
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 13.0)
                            .foregroundColor(.black)
                            .padding(.trailing, 53.0)
                    }
                }
                
            }.padding(.bottom, 3.0)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(Color.white)
                    .frame(width: 382.0, height: 97.0)
                    .shadow(color: shadowcolor, radius: 6, x: 0.0, y: 3.0)
                VStack {
                    Text("Log Gallery")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.title2)
                        .padding(.trailing, 205.0)
                    Text("Check your own gallery.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.trailing, 155.0)
                }
                
                HStack {
                    NavigationLink(destination: MainGalleryView()){
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 13.0)
                            .foregroundColor(.black)
                            .padding(.trailing, 53.0)
                    }
                }
                
            }.padding(.bottom, 3.0)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(Color.white)
                    .frame(width: 382, height: 97)
                    .shadow(color: shadowcolor, radius: 6, x: 0.0, y: 3.0)
                VStack {
                    Text("Your Walkette")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.title2)
                        .padding(.trailing, 185.0)
                    Text("Comprehensive analysis of your records.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.trailing, 43.0)
                }
                
                HStack {
                    NavigationLink(destination: AnalysisView()){
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 13.0)
                            .foregroundColor(.black)
                            .padding(.trailing, 53.0)
                    }
                }
                
            }
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
