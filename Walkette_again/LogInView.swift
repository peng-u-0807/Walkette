//
//  LogInView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import SwiftUI

struct LogInView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome \(username)")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            TextField("Enter ID", text: $username).background(Image("idInput"), alignment: .center).padding(.vertical, 33.0).padding(.horizontal, 18.0)
            SecureField("Enter PW", text: $password).background(Image("idInput"), alignment: .center).padding(.horizontal, 18.0)
            
            Spacer()
            
            NavigationLink(destination: MainView()){
                Text("Log In")
                    .font(.title3)
                    .foregroundColor(.white)
            }.background(Image("Box_Mint"), alignment: .center)
            .padding(.bottom, 60.0)
            
        }.padding(.horizontal, 60.0)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
