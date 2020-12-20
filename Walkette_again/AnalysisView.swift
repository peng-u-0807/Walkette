//
//  AnalysisView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import SwiftUI

struct AnalysisView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                
                    NavigationLink(destination: MenuView()){
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22.0)
                            .foregroundColor(.black)
                    }

                    Spacer()
                    
                    Text("Your Walkette")
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
                
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            
        }.background(Image("innerBackground"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
