//
//  Rental.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

class Rental: NSObject {
    private let movie: Movie
    private let daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    func getDaysRented() -> Int {
        return self.daysRented
    }
    
    func getMovie() -> Movie {
        return self.movie
        
    }
    
}
