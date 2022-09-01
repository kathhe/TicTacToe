//
//  ContentView.swift
//  TicTacToe
//
//  Created by Kathrine Heinzel 875340
//

import SwiftUI

class TTTBrain: ObservableObject {
    @Published var wSpieler = true
    var playerMoves: [Int] = Array()
    var computerMoves: [Int] = Array()
    
    var isAlmostWin = false
    var isWin: Bool = false
    var isDraw: Bool = false

    
    // Prüft ob der Inhalt eines Arrays in einem anderen zu finden sind.
    func containedInArray(arrayPlayer: [Int], arrayCompare: [Int]) -> Bool {
        var set = Set(arrayPlayer)
        let intersection = arrayCompare.filter { !set.insert($0).inserted }

        if(intersection == arrayCompare) {
            return true
        } else {
            return false
        }
    }
    
    // Prüft ob das Spiel gewonnen wurde
    func checkWin(currentArray: [Int], message: String) {
        print("checkWin(): This is the current array: \(currentArray)")

        if( containedInArray(arrayPlayer: currentArray, arrayCompare: [0,1,2]) ) {
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,4,5]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,7,8]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,3,6]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,4,7]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,5,8]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,4,8]) ){
            self.isWin = true
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,4,6]) ){
            self.isWin = true
        }
    }
    
    // Prüft ob das Spiel unentschieden ist
    func checkDraw(spBrett: [String?]) -> Bool {
        var isFull = true
        for feld in spBrett {
            if(feld == nil) {
                isFull = false
            }
        }
        if(isFull == true) {
            self.isDraw = true
        }
        return isFull
    }
    
    // Ermittelt den Zug, mit dem der Rechner den Gewinn des Spielers blockiert.
    func thwartMove(currentArray: [Int], rechnerArray: [Int]) -> Int {
        if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,1])) {
            if(!rechnerArray.contains(2)) {
                return 2
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,2])) {
            if(!rechnerArray.contains(1)) {
                return 1
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,2])) {
            if(!rechnerArray.contains(0)) {
                return 0
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,4]) ){
            if(!rechnerArray.contains(5)) {
                return 5
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,5]) ){
            if(!rechnerArray.contains(4)) {
                return 4
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,5]) ){
            if(!rechnerArray.contains(3)) {
                return 3
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,7]) ){
            if(!rechnerArray.contains(8)) {
                return 8
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,8]) ){
            if(!rechnerArray.contains(7)) {
                return 7
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,8]) ){
            if(!rechnerArray.contains(7)) {
                return 7
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,3]) ){
            if(!rechnerArray.contains(6)) {
                return 6
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,6]) ){
            if(!rechnerArray.contains(3)) {
                return 3
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,6]) ){
            if(!rechnerArray.contains(0)) {
                return 0
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,4]) ){
            if(!rechnerArray.contains(7)) {
                return 7
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,7]) ){
            if(!rechnerArray.contains(4)) {
                return 4
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,7]) ){
            if(!rechnerArray.contains(1)) {
                return 1
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,5]) ){
            if(!rechnerArray.contains(8)) {
                return 8
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,8]) ){
            if(!rechnerArray.contains(5)) {
                return 5
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [5,8]) ){
            if(!rechnerArray.contains(2)) {
                return 2
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,4]) ){
            if(!rechnerArray.contains(8)) {
                return 8
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,8]) ){
            if(!rechnerArray.contains(4)) {
                return 4
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,8]) ){
            if(!rechnerArray.contains(0)) {
                return 0
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,4]) ){
            if(!rechnerArray.contains(6)) {
                return 6
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,6]) ){
            if(!rechnerArray.contains(4)) {
                return 4
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,6]) ){
            if(!rechnerArray.contains(2)) {
                return 2
            }
        }
        return 9;
    }
    
    // Prüft ob das Spiel im nächsten Zug gewonnen wird.
    func checkAlmostWin(currentArray: [Int], rechnerArray: [Int]) {
        print("checkAlmostWin(): This is the current array: \(currentArray)")
        let message = "Almost win!"
        
        if( containedInArray(arrayPlayer: currentArray, arrayCompare: [0,1]) ) {
            if(rechnerArray.contains(2)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if( containedInArray(arrayPlayer: currentArray, arrayCompare: [0,2]) ) {
            if(rechnerArray.contains(1)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if( containedInArray(arrayPlayer: currentArray, arrayCompare: [1,2]) ) {
            if(rechnerArray.contains(0)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,4]) ){
            if(rechnerArray.contains(5)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,5]) ){
            if(rechnerArray.contains(4)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,5]) ){
            if(rechnerArray.contains(3)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,7]) ){
            if(rechnerArray.contains(8)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [6,8]) ){
            if(rechnerArray.contains(7)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [7,8]) ){
            if(rechnerArray.contains(6)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,3]) ){
            if(rechnerArray.contains(6)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [3,6]) ){
            if(rechnerArray.contains(0)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,6]) ){
            if(rechnerArray.contains(3)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,4]) ){
            if(rechnerArray.contains(7)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [1,7]) ){
            if(rechnerArray.contains(4)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,7]) ){
            if(rechnerArray.contains(1)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,5]) ){
            if(rechnerArray.contains(8)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,8]) ){
            if(rechnerArray.contains(5)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [5,8]) ){
            if(rechnerArray.contains(2)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,4]) ){
            if(rechnerArray.contains(8)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [0,8]) ){
            if(rechnerArray.contains(4)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,8]) ){
            if(rechnerArray.contains(0)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,4]) ){
            if(rechnerArray.contains(6)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [2,6]) ){
            if(rechnerArray.contains(4)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        } else if(containedInArray(arrayPlayer: currentArray, arrayCompare: [4,6]) ){
            if(rechnerArray.contains(2)) {
                self.isAlmostWin = false
            } else {
                self.isAlmostWin = true
                print(message)
            }
        }
    }
    
    // Speichert die Züge des Spielers in einer Array
    func savePlayerMoves(selectedIndex: Int){
        wSpieler = true
        
        self.playerMoves.append(selectedIndex)
        playerMoves.sort()
        checkWin(currentArray: playerMoves, message: "You've won!")
        checkAlmostWin(currentArray: playerMoves, rechnerArray: computerMoves)
    }
    
    // Speichert die Züge des Rechners in einer Array
    func saveComputerMoves(selectedIndex: Int){
        wSpieler = false
        
        self.computerMoves.append(selectedIndex)
        computerMoves.sort()
        checkWin(currentArray: computerMoves, message: "The computer won!")
    }
    
    // Führt die Züge aus
    func zug(row: Int, column: Int, sBrett: inout [String?])  {
        var indexAI = Int.random(in: 0...8)
        print("A move was made.")
    
        if(sBrett[3 * row + column] == nil) {
            sBrett[3 * row + column] = "×"
            savePlayerMoves(selectedIndex: 3 * row + column)
            
            if(wSpieler) {
                if(isWin){
                    return
                }
                // Prüft ob ein Gewin kurz bevor steht und stopped diesen
                if(isAlmostWin) {
                    indexAI = thwartMove(currentArray: playerMoves, rechnerArray: computerMoves);
                    if(indexAI != 9){
                        sBrett[indexAI] = "○"
                        saveComputerMoves(selectedIndex: indexAI)
                        self.isAlmostWin = false
                    }
                } else {
                    if(!checkDraw(spBrett: sBrett)) {
                        while(sBrett[indexAI] != nil ) {
                            indexAI = Int.random(in: 0...8)
                            if(self.isWin) {
                                return
                            }
                        }
                        sBrett[indexAI] = "○"
                        saveComputerMoves(selectedIndex: indexAI)
                    }
                }
            }
        }
    }
    
    // Startet das Spiel neu
    func resetFields() {
        playerMoves = Array()
        computerMoves = Array()
        self.wSpieler = true
        self.isWin = false
        self.isDraw = false
    }
}

// Die View eines Feldes
struct ButtonView: View {
    var action: () -> Void
    var index: String
    var buttonBgColor: Color {
        return Color(red: 225 / 255, green: 222 / 255, blue: 206 / 255)
    }
    var buttonColor: Color {
        return Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
    }

    var body: some View {
        Button( action: {self.action()} ){
            Text( index )
            .frame(width: 100, height: 100, alignment: .center)
            .font(.system(size: 28))
            .background(buttonBgColor)
            .foregroundColor(buttonColor)
            .clipShape(Rectangle())
        }
    }
}

struct ContentView: View {
    // Spannt das Spielbrett für die Felder auf
    @State var spielBrett: [String?] = Array(repeating: nil, count:9)
    @StateObject var brain = TTTBrain()
    let rowRange = 3
    let columnRange = 3
    var bgColor: Color {
        return Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255)
    }
    var resetButtonBgColor: Color {
        return Color(red: 208 / 255, green: 255 / 255, blue: 99 / 255)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Text("Tic Tac Toe")
                    .frame(width:300, alignment: .center)
                    .font(.system(size: 42, design: .monospaced))
                    .foregroundColor(resetButtonBgColor)
                    .background(bgColor)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: 0))
            }
            
            VStack(alignment: .center) {
                ForEach(0..<rowRange) { row in
                    HStack(alignment: .center) {
                        ForEach(0..<columnRange) { column in
                            ButtonView( action: {brain.zug(row: row, column: column, sBrett: &spielBrett)}, index: spielBrett[columnRange * row + column] ?? " ")
                        }
                    }
                }
            }
            
            VStack(alignment: .center) {
                if(brain.wSpieler && brain.isWin) {
                    Text("You've won!")
                        .frame(width:300, alignment: .center)
                        .font(.system(size: 24, design: .monospaced))
                        .foregroundColor(resetButtonBgColor)
                        .background(bgColor)
                        .padding(12)
                } else if(!brain.wSpieler && brain.isWin) {
                    Text("Computer won!")
                        .frame(width:300, alignment: .center)
                        .font(.system(size: 24, design: .monospaced))
                        .background(bgColor)
                        .foregroundColor(resetButtonBgColor)
                        .padding(12)
                } else if(brain.isDraw) {
                    Text("Draw!")
                        .frame(width:300, alignment: .center)
                        .font(.system(size: 24, design: .monospaced))
                        .foregroundColor(resetButtonBgColor)
                        .background(bgColor)
                        .padding(12)
                } else {
                    Text("...")
                        .frame(width:300, alignment: .center)
                        .font(.system(size: 24, design: .monospaced))
                        .foregroundColor(bgColor)
                        .background(bgColor)
                        .padding(12)
                }
            }
            
            Button(action: {
                spielBrett = Array(repeating: nil, count:9)
                brain.resetFields() } ){
                Text("Reset")
                .frame(width: 316, height: 60, alignment: .center)
                .background(resetButtonBgColor)
                .foregroundColor(bgColor)
                .clipShape(Rectangle())
            }
        }.background(bgColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
