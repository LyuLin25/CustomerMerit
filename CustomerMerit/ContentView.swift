//
//  ContentView.swift
//  CustomerMerit
//
//  Created by Lyu Lin on 2023/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var gameType:String = "商业功德"
    @State var totalNumber:Int = 0
    @State var number:Int = 1
    @State var isTap:Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    if isTap {
                        Text(gameType+" + "+String(number))
                    }
                    
                    Image("woodenfish").resizable().aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 180, maxHeight: 180)
                        .scaleEffect(isTap ? 0.99 : 1.0)
                        .onTapGesture{
                            totalNumber+=number
                            if !isTap {
                                self.isTap.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                                    self.isTap.toggle()
                                }
                            }
                        }
                        .onLongPressGesture {
                            if !isTap {
                                self.isTap.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.005) {
                                    self.isTap.toggle()
                                }
                            }
                        }
                }
                .padding()
                .navigationTitle(gameType+": "+String(totalNumber))
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    ContentView()
}
