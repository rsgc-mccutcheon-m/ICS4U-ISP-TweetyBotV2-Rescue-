//
//  MarkovChain.swift
//  TweetyBot
//
//  Created by Jarvis on 2017-02-23.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


class MarkovChain {
    
    var words : [String] = []
    var suffix : [String : Int] = [:]
    var prefix : [String: [String: Int]] = [:]
    
    var inputSuffix : String = ""
    var primeIndex : Int = 0
    var secondIndex : Int = 0
    var chainGen : Bool = false
    
    init () {
        
        //self.words = words
        
    }
    
    func genStndChain() {
        
        for (index, word) in self.words.enumerated() {
            
            // Stop loop before no suffix remains
            if index == words.count - 1 {
                break
            }
            
            // when the current word from the input array is not in the prefix dictionary at all & skip blank entries
            if self.prefix[word] == nil && word != " " {
                
                self.suffix[words[index + 1]] = 1    // add a count of 1 for the suffix (word following current word in input)
                self.suffix["📐"] = 1                // triangular ruler key represents total # of suffixs count
                self.prefix[word] = suffix           // current word from input array becomes key in prefix dictionary with value of suffix dictionary just created
                
            } else {
                
                // add 1 to total in suffix dictionary
                prefix[word]!["📐"]! += 1
                
                // does current word exist as a suffix already?
                if prefix[word]![words[index + 1]] == nil {         // does not exist, so create and set to 1
                    prefix[word]![words[index + 1]] = 1
                    
                } else {                                            // does exist, so increment by 1
                    prefix[word]![words[index + 1]]! += 1
                }
            }
            
            // wipe out the suffix dictionary for next iteration, so it starts blank
            suffix = [:]
        }
        
        chainGen = true
    }
    
    
    func gen2suffixChain() {
        
        for (index, word) in self.words.enumerated() {
            
            // Stop loop before no suffix remains
            if index == words.count - 2 {
                break
            }
            
            
            primeIndex = words.index(after: index)
            secondIndex = primeIndex + 1
            if secondIndex < words.count {
            inputSuffix = words[primeIndex] + " " + words[secondIndex]
                
            }
            
            
            // when the current word from the input array is not in the prefix dictionary at all & skip blank entries
            if self.prefix[word] == nil && word != " " {
                
                
                self.suffix[inputSuffix] = 1    // add a count of 1 for the suffix (word following current word in input)
                
                //                let nextPosition = words.index(after: index)
                //                let nextNextPosition = words.index(after: nextPosition)
                self.suffix["📐"] = 1                // triangular ruler key represents total # of suffixs count
                self.prefix[word] = suffix           // current word from input array becomes key in prefix dictionary with value of suffix dictionary just created
                
            } else {
                
                // add 1 to total in suffix dictionary
                prefix[word]!["📐"]! += 1
                
                // does current word exist as a suffix already?
                if prefix[word]![inputSuffix] == nil {         // does not exist, so create and set to 1
                    prefix[word]![inputSuffix] = 1
                    
                } else {                                            // does exist, so increment by 1
                    prefix[word]![inputSuffix]! += 1
                }
            }
            
            // wipe out the suffix dictionary for next iteration, so it starts blank
            suffix = [:]
            
            
        }
        
        chainGen = true
        print(words.count)
        
    }
    
    func genTweet(length: Int) -> String {
        
        if (chainGen) {
            
            print(" Generating Tweet now: \n")
            
            var Tweet : String = ""
            
            var currentWord = self.words[Int(arc4random_uniform(UInt32(words.count)))] // output sentence will start with this word
            
            //Capitalize first letter of seed word
            
            print("Seed word is: \(currentWord) \n")
            
            var output: String = currentWord + " "    // start the output sentence
            
            print("Initial output sentence is: \(output) \n")
            
            var endSentence: Bool = false
            
            for current in 0...length {
                
                print("IN FOR LOOP + \(prefix[currentWord] != nil) + \(currentWord != " ")")
                print("Current word set to: \(currentWord) ")
                print("\(prefix[currentWord]) \n")
                
                if prefix[currentWord] != nil && currentWord != " " {
                    print("IF LOOP PASSED")
                    // Generate the random value
                    let randomValue = Float(arc4random_uniform(1000000)) / 10000
                    
                    // Stores upper value of probability for current suffix word
                    var upperValue: Float = 0
                    
                    // iterate over all suffix words for this prefix
                    for (potentialSuffix, count) in prefix[currentWord]! {
                        
                        // get total suffix words for this prefix
                        let totalSuffixWords = prefix[currentWord]!["📐"]!
                        
                        
                        
                        // exclude the instance of the suffix that contains the suffix total
                        if potentialSuffix != "📐" {
                            
                            //get upper value
                            upperValue += Float(count) / Float( totalSuffixWords ) * 100
                            
                            print("upper value is: \(upperValue)")
                            print("random value is: \(randomValue) \n")
                
                            
                            //Check if suffix is eligible for use
                            if (randomValue < upperValue) {
                                
                                // add the potential (now chosen) suffix to the output string
                                output += potentialSuffix
                                
                                
                                print("Current suffix to add is: \(potentialSuffix) ")
                                // make the potential (now chosen) suffix the new prefix
                                let currentwords = potentialSuffix.components(separatedBy: " ")
                                
                                print( "Split suffix into array for use in setting next seed word, array is: \(currentwords) ")
                                
                                guard let potentialCurrentWord = currentwords.last
                                    else {
                                        print("Failed to unwrap last word of \(currentwords.count) element suffix array. Suffix array contains: \(currentwords)" )
                                        exit(0)
                                
                                }
                                
                                print("Potential current word is: \(potentialCurrentWord)")
                                currentWord = potentialCurrentWord
                                
                                
                                //Check for end of sentence
                                if output.characters.last == "."{
                                    
                                    output += " "
                                    break
                                }
                                
                                print(output + "0 \n \n")
                                // Add a space before the next word
                                output += " "
                                
                                // break the loop going over the word probabilities (since we have found a word to add)
                                break
                            }
                        }
                    }
                } else {
                    currentWord = self.words[Int(arc4random_uniform(UInt32(words.count)))].capitalized // output sentence will start with this word
                    
                }
                
                
            }
            
            if output.characters.last != "." {
                
                output.characters.popLast()
                output += "."
                
            }
            
            Tweet = output.capitalizeFirst()
            
            return Tweet
            
        } else {
            print("No chain to generate output with")
            exit(0)
        }
    }
    
}


//provide a capitalize first letter method on string type variables to allow for easy tweet formating!
extension String {
    func capitalizeFirst() -> String {
        let firstIndex = self.index(startIndex, offsetBy: 1)
        return self.substring(to: firstIndex).capitalized + self.substring(from: firstIndex).lowercased()
    }
}
