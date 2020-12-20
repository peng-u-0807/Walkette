//
//  ContentView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import SwiftUI

struct ContentView: View {
    
    let greenblue = Color(red: 47.0 / 255.0, green: 166.0 / 255.0, blue: 165.0 / 255.0)
    let darkgrey = Color(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0)
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Image("logo")
                        .padding(.top, 160)
                    Text("Walkette")
                        .fontWeight(.semibold)
                        .font(.title3)
            
                    Spacer()
        
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                            .foregroundColor(.black)
                            .font(.title3)
                            .background(Image("Box_White"), alignment: .center)
                    }
                    .padding([.top, .bottom], 35.0)
                    .foregroundColor(.black)
            
                    NavigationLink(destination: LogInView()){
                        Text("Log In")
                        .foregroundColor(.black)
                            .font(.title3)
                            .background(Image("Box_Gray"), alignment: .center)
                    }
                    .padding(.bottom, 90.0)

                }
            }.background(Image("Background"), alignment: .center)
            .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
