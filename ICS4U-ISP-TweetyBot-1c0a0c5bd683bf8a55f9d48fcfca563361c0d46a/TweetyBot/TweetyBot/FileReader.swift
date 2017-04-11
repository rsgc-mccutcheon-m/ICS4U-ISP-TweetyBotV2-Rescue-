//
//  FileReader.swift
//  TweetyBot
//
//  Created by Jarvis on 2017-02-22.
//  Copyright © 2017 Clutch Design Solutions. All rights reserved.
//

import Foundation


class FileReader {
    
    let path: String
    
    fileprivate let file: UnsafeMutablePointer<FILE>!
    
    init?(path: String) {
        self.path = path //get path from argument
        
        file = fopen(path, "r") //open the file in read mode
        
        guard file != nil else {return nil} //confirm that the file contains something
    }
    
    
    var nextLine: String? {
        var line: UnsafeMutablePointer<CChar>? = nil
        var linecap : Int = 0
        defer {free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }
    
    deinit {
        fclose(file)
    }
    
}

extension FileReader: Sequence{
    func makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}
