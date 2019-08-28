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
    
    func getCharge() -> Double {
        var amount: Double = 0
        switch getMovie().getPriceCode() {
        case Movie.REGULAR:
            amount += 2
            if getDaysRented() > 2 {
                amount += Double((getDaysRented() - 2)) * 1.5
            }
        case Movie.NEW_RELEASE:
            amount += Double(getDaysRented()) * 3.0
        case Movie.CHILDRENS:
            amount += 1.5
            if getDaysRented() > 3 {
                amount += Double((getDaysRented() - 3)) * 1.5
            }
        default:
            break
        }
        return amount
    }
    
    func getFrequentRenterPoint() -> Int {
        if getMovie().getPriceCode() == Movie.NEW_RELEASE && getDaysRented() > 1{
            return 2
        } else {
            return 1
        }
    }
    
}
