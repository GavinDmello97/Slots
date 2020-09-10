//
//  ContentView.swift
//  Learn
//
//  Created by Zaya Developer on 09/09/20.
//  Copyright © 2020 Zaya Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var creditCount = 1000;
    @State private var didStart = false;
    @State private var symbols = ["berry", "apple", "grape"];
    @State private var backgroundColor = [Color.white, Color.white, Color.white];
    @State private var backgroundColor2D: [[Color]] = [[Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white]];
    @State private var numbers = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    @State private var array2D: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    private var minBetSpin = 10
    private var maxBetSpin = 50

    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 200 / 255, green: 143 / 255, blue: 33 / 255, opacity: 0.8)).edgesIgnoringSafeArea(.all)

            Rectangle().foregroundColor(Color(red: 228 / 255, green: 195 / 255, blue: 76 / 255, opacity: 1.0)).rotationEffect(Angle(degrees: 50)).edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill").foregroundColor(Color(red: 255 / 255, green: 143 / 255, blue: 33 / 255, opacity: 1.0))
                    Text("Slots Swift")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Image(systemName: "star.fill").foregroundColor(Color(red: 255 / 255, green: 143 / 255, blue: 33 / 255, opacity: 1.0))
                }.scaleEffect(1.5)
                Spacer()
                if(self.didStart == true && self.creditCount > 0) {

                    Text("Credits: $" + String(self.creditCount)).padding(.all, 10)
                        .foregroundColor(Color(.black)).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Spacer()
                }
                if(self.didStart == false) {
                    VStack {
                        VStack {
                            Text("Instructions").font(.headline).fontWeight(.bold).foregroundColor(Color.black).padding(.bottom, 5.0)
                            Text("• Each player starts with $1000.\n• Each win gives you 10x the bet amount.\n• If your currency reaches '0', the game ends.").font(.subheadline).fontWeight(.regular).foregroundColor(Color.black).multilineTextAlignment(.leading).padding(.horizontal)
                        }.padding()

                    }
                    .background(Color.white).cornerRadius(5).padding()
                    Spacer()

                    Text("Ready to test your luck?").padding()

                    Button(action: {

                        self.didStart = true;

                    }) { Text("Play").foregroundColor(Color.white).bold().padding(.all, 10).padding(.horizontal, 30).background(Color.pink)
                    }.cornerRadius(30)

                }
                else if(self.didStart == true && self.creditCount <= 0) {
                    Text("Game Over").font(.largeTitle).padding()
                    Spacer()

                    Button(action: {

                        self.didStart = true;
                        self.creditCount = 1000

                    }) { Text("Play Again").foregroundColor(Color.white).bold().padding(.all, 10).padding(.horizontal, 30).background(Color.pink)
                    }.cornerRadius(30)
                }
                else
                {
                    VStack {

                        HStack {
                            Spacer()
                            Spacer()
                            Card(symbol: $symbols[self.array2D[0][0]], backgroundColor: $backgroundColor2D[0][0])
                            Card(symbol: $symbols[self.array2D[0][1]], backgroundColor: $backgroundColor2D[0][1])
                            Card(symbol: $symbols[self.array2D[0][2]], backgroundColor: $backgroundColor2D[0][2])
                            Spacer()
                            Spacer()

                        }

                        HStack {
                            Spacer()
                            Spacer()
                            Card(symbol: $symbols[self.array2D[1][0]], backgroundColor: $backgroundColor2D[1][0])
                            Card(symbol: $symbols[self.array2D[1][1]], backgroundColor: $backgroundColor2D[1][1])
                            Card(symbol: $symbols[self.array2D[1][2]], backgroundColor: $backgroundColor2D[1][2])
                            Spacer()
                            Spacer()

                        }

                        HStack {
                            Spacer()
                            Spacer()
                            Card(symbol: $symbols[self.array2D[2][0]], backgroundColor: $backgroundColor2D[2][0])
                            Card(symbol: $symbols[self.array2D[2][1]], backgroundColor: $backgroundColor2D[2][1])
                            Card(symbol: $symbols[self.array2D[2][2]], backgroundColor: $backgroundColor2D[2][2])
                            Spacer()
                            Spacer()

                        }

                    }



                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {


                                for k in 0...self.array2D[1].count - 1 {
                                    self.array2D[1][k] = Int.random(in: 0...self.symbols.count - 1)

                                }


                                if(self.array2D[1][0] == self.array2D[1][1] && self.array2D[1][1] == self.array2D[1][2])
                                {

                                    self.backgroundColor2D[1][0] = Color.green
                                    self.backgroundColor2D[1][1] = Color.green
                                    self.backgroundColor2D[1][2] = Color.green
//                                    self.creditCount += self.minBetSpin * 10
                                }
                                else {
                                    self.backgroundColor2D[1][0] = Color.white
                                    self.backgroundColor2D[1][1] = Color.white
                                    self.backgroundColor2D[1][2] = Color.white
                                    self.creditCount -= self.minBetSpin

                                }


                            }) { Text("Spin").foregroundColor(Color.white).bold().padding(.all, 10).padding(.horizontal, 30).background(Color.pink)
                            }.cornerRadius(30)

                            Text("Cost:" + String(minBetSpin)).padding(.all, 5.0)
                        }
                        Spacer()
                        VStack {
                            Button(action: {
                                self.backgroundColor2D = [[Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white]];
                                for i in 0...self.array2D.count - 1 {
                                    for j in 0...self.array2D[i].count - 1 {
                                        self.array2D[i][j] = Int.random(in: 0...self.symbols.count - 1)

                                    }
                                }
                                if(self.array2D.count > 0) {

                                    for x in 0...self.array2D.count - 1 {
                                        if(self.array2D[x][0] == self.array2D[x][1] && self.array2D[x][1] == self.array2D[x][2])
                                        {
                                            self.backgroundColor2D[x] = self.backgroundColor2D[x].map { _ in
                                                Color.green
                                            }

                                            self.creditCount += self.maxBetSpin * 10
                                        }
                                        else {
                                            self.backgroundColor2D[x] = self.backgroundColor2D[x].map { _ in
                                                Color.white
                                            }
                                            self.creditCount -= self.maxBetSpin

                                        }
                                    }

                                    for y in 0...self.array2D[0].count - 1 {
                                        if(self.array2D[0][y] == self.array2D[1][y] && self.array2D[1][y] == self.array2D[2][y])
                                        {
                                            for z in 0...self.array2D.count - 1 {
                                                self.backgroundColor2D[z][y] = Color.green
                                            }

                                            self.creditCount += self.maxBetSpin * 10
                                        }
                                        else {
                                            for z in 0...self.array2D.count - 1 {
                                                if(self.backgroundColor2D[z][y] != Color.green) {
                                                    self.backgroundColor2D[z][y] = Color.white
                                                }

                                            }
                                            self.creditCount -= self.maxBetSpin

                                        }
                                    }

                                    if(self.array2D[0][0] == self.array2D[1][1] && self.array2D[1][1] == self.array2D[2][2]) {
                                        for q in 0...self.array2D.count - 1 {
                                            self.backgroundColor2D[q][q] = Color.green
                                        }
                                    }
                                    if(self.array2D[0][2] == self.array2D[1][1] && self.array2D[1][1] == self.array2D[2][0]) {
                                        self.backgroundColor2D[0][2] = Color.green
                                        self.backgroundColor2D[1][1] = Color.green
                                        self.backgroundColor2D[2][0] = Color.green


                                    }
                                }




                            }) { Text("Max Spin").foregroundColor(Color.white).bold().padding(.all, 10).padding(.horizontal, 15).background(Color.pink).cornerRadius(30)
                            }

                            Text("Cost:" + String(maxBetSpin)).padding(.all, 5.0)
                        }
                        Spacer()
                    }
                }

                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}


