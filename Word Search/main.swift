//
//  main.swift
//  Word Search
//
//  Created by Lou El Idrissi on 11/13/24.
//

// can't make sure there are never are words other than the ones

import Foundation


// Initializa Game Board
var board = [
    [" . ", " . ", " . ", " . ", " . ", " . ", " . "], // Row 0
    [" M ", " I ", " N ", " D ", " . ", " . ", " . "], // Row 1
    [" . ", " . ", " P ", " E ", " A ", " C ", " E "], // Row 2
    [" . ", " . ", " . ", " . ", " . ", " . ", " . "], // Row 3
    [" . ", " L ", " O ", " V ", " E ", " . ", " . "], // Row 4
    [" . ", " . ", " . ", " . ", " . ", " . ", " . "] // Row 5
]
let columnLabels = " 1  2  3  4  5  6  7 "


// Print Board Function
func printBoard() {
    let reversedBoard = board.reversed()
    for row in reversedBoard {
        //    print("ROW", row)
        var rowString = ""
        for cell in row {
            // print("CELL", cell)
            rowString += cell
        }
        print(rowString)
    }
    //print(columnLabels)
}
//printBoard()


// Generate a random character from the alphabet
func randomCharFun() -> String{
    let alphabet : String = "abcdefghijklmnopqrstuvwxyz"
    let characters = Array(alphabet)
    //print(characters)
    let randomChar = characters.randomElement()!
    let tempString = " " + String(randomChar) + " "
    return String(tempString).uppercased()
}

let rows = board.indices //.count
let columns = board[0].indices

//print("r",rows)
//print("c",columns)


// Fill Empty Locations in Board
func generateBoard() {
//    var i = 0
//    var j = 1

    for i in rows{
        for j in columns{
            if board[i][j] == " . " {
                board[i][j] = randomCharFun()
                //print("i", i)
                //print("board[i][j]", board[i][j])
            }
            else {
                // skip
            }
        }
    }
}




let words = ["mind", "peace", "love"]
var wordsRemaining = words // [String]()

var gameOver = false
let maxtrialNum = words.count
var currentTrialNum = 0


func wordSearch () {
    while !gameOver {
        //print("wordsRemaining", wordsRemaining)
       // print()
        print("Enter one word you found here: ")
        
        if let userInput = readLine() {
            print()
            // Update number of trials tracker
            currentTrialNum = currentTrialNum + 1
            //print("currentTrialNum ", currentTrialNum )
            //print("maxtrialNum", maxtrialNum)
            //print("maxtrialNum-1", maxtrialNum-1)
            print()
            //print("wordsRemaining", wordsRemaining)
            
            // Check user input. If user finds a word, remove it from the list of words to look for.
            // if there are no more words left to look for, the user has one,
            // otherwise, the user can keep guessing as long as the number of trials in under the max trial number.
            if words.contains(userInput)  {
                wordsRemaining.removeAll(where: { $0 == userInput })
                
               // attempts not exceeding max possible number
                if currentTrialNum < maxtrialNum {
                    if wordsRemaining.count == 0 {
                        print("Congratualtions, you have won! ")
                        print("We hope to see you again :)")
                        gameOver = true
                    }
                    else {
                        print("Nice job! ")
                        print("There are more words to find, let's see how you do ! ")
                        print()
                    }
                }
                // have found all words and no more attempts
                if currentTrialNum == maxtrialNum && wordsRemaining.count == 0 {
                        print("Congratualtions, you have won! ")
                        print("We hope to see you again :)")
                        gameOver = true
                }
                if currentTrialNum > maxtrialNum {
                    print("Nice job! Your word is correct! ")
                    print()
                    print("Unfortunately, you have exceeded number of attempts. ")
                    print()
                    print("Thank you for playing!") //Feel free to play the game again!")
                    gameOver = true
                }
            }
           
            else{
                if wordsRemaining.count != 0 {
                    // let user  know it's their last chance
                    if currentTrialNum == maxtrialNum {
                        print("This is your last chance, you got this! ")
                        print()
                    }
                    
                    // user exceeded number of trials. Close the game
                    if  currentTrialNum > maxtrialNum {
                        print("This word is not on the board. ")
                        print()
                        print("Unfortunately, you have exceeded number of attempts. ")
                        print()
                        print("Thank you for playing!") //Feel free to play the game again!")
                        gameOver = true
                    }
                    // trials lefts, keep going
                    if currentTrialNum < maxtrialNum {
                        print("Unfortunately, this word is not on the board. ")
                        print("Please try again!")
                        print()
                        
                    }
                    
                }
                
            }
        }
    }
}

func gameInstructions() {
    print("Welcome to the Mindfulness Word Search! ")
    print()
    print("Instructions:  Find mindfulness themes words hidden on the letter board. ")
    print()
    print("Are you up to the challenge ? Go!")
    print()
}

func playWordSearch(){
    generateBoard()
    gameInstructions()
    printBoard()
    print()
    wordSearch ()
}

playWordSearch()



func randomDir() -> Int {
    // 0 for horizontal left to right
    // 1 for vertical downwards
    let  direction = [0, 1]
   
    //print(characters)
    let randomDir = direction.randomElement()!
    //print("randomDir", randomDir)
    return randomDir
}
 
//var dir = randomDir()

//board - word.count
//board[0] - word.count

// get random location  of the start of the word
// 0..< board - word.count or 0..<board[0] - word.count

/*

var startLocation = 0
var wordLen = 0
var startLocationWords : [Int] = []

var wordIndex = 0
// get an array for start location of the words
// can't have a word longer than the board's dimensions
for word in words{
    if board.count != word.count {
        //print("board.count", board.count)
        //print("word.count", word.count)
        wordLen = board.count - word.count
    }else{
        startLocation = 0
    }

    let startRange = 0..<wordLen
    // get random location from the range of possible start Locations
    startLocation = startRange.randomElement()!
    //print("startRange", startRange)
    //print( "startLocation", startLocation)
    // get index of work from words Array
    if let wordIndex = words.firstIndex(of: word) {
        startLocationWords.insert(startLocation, at : wordIndex)
        //print("word index", wordIndex)
    }
    i = startLocation
    j =
    for char in word {
        
        //if dir == 0{
            // board[i+1][j] at each loop through the word characters
            // get a random j between 0 and number of columns
                // and i from possible start location range
            //board[0].randomElement()
        board[i+1][j] = char
        }
    // use as index of start Location  of that word in Array
    // choose a direction after choosing the start
    //randomDir()
    
    // INSERT FOR LOOP HERE TO INSERT WORDS IN THE BOARD
    
    // keep the same y, change the x coord
    // board[i+1][j] at each loop through the word characters
            // increment i by 1, j is constant
    // pick a random y that won't change
    // or keep the same x and change the y coord
    // board[i][j+1] at each loop through the word characters
            // i is constant, increment j by 1
    // pick a random x that won't change
    // board[]
}


for char in word {
    
    if dir == 0{
        // board[i+1][j] at each loop through the word characters
        // get a random j between 0 and number of columns
            // and i from possible start location range
        //board[0].randomElement()
        board[i+1][j] = char
    };
    if dir == 1{
        // board[i][j+1] at each loop through the word characters
        board[i][j+1] = char
    }
}
 
print("startLocationWords", startLocationWords )


//control i auto fix indent


//printBoard()
//for i in board.indices() {
//  print("board.indices", board.indices)
//}


// directions that words can be printed
// directions has x and y coordinates
// x-axis is positive towards the right
// y-axis is positve downwards

// x + 1 and y constant
//let left_to_right =



 // x - 1 and y constant
 let right_to_left =
 
 // x + 1 and y + 1
 let left_to_right_diagonal =
 // x - 1 and y + 1
 let right_to_left_diagonal =
 
 // x constant and y + 1
 let up_to_down =
 // x constant and y - 1
 let down_to_up =
 


 let columnLabels = " 1  2  3  4  5  6  7 "
 func printBoard() {
 let reversedBoard = board.reversed()
 for row in reversedBoard {
 var rowString = ""
 for cell in row {
 //
 rowString += cell
 
 }
 print(rowString)
 }
 print(columnLabels)
 }
 printBoard()
 
*/

