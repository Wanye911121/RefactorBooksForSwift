//
//  Price.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

protocol Price: class {
    func getPriceCode() -> Int
    func getCharge(daysRented: Int) -> Double
    func getFrequentRenterPoint(daysRented: Int) -> Int 
}

class ChildrenPrice: Price {
    func getPriceCode() -> Int {
        return Movie.CHILDRENS
    }
    
    func getCharge(daysRented: Int) -> Double {
        var charge: Double = 0
        charge += 1.5
        if daysRented > 3 {
            charge += Double((daysRented - 3)) * 1.5
        }
        return charge
    }
    
    func getFrequentRenterPoint(daysRented: Int) -> Int {
        return 1
    }
}

class NewReleasePrice: Price {
    func getPriceCode() -> Int {
        return Movie.NEW_RELEASE
    }
    
    func getCharge(daysRented: Int) -> Double {
        var charge: Double = 0
        charge += Double(daysRented) * 3.0
        return charge
    }
    
    func getFrequentRenterPoint(daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}

class RegularPrice: Price {
    func getPriceCode() -> Int {
        return Movie.REGULAR
    }
    
    func getCharge(daysRented: Int) -> Double {
        var charge: Double = 0
        charge += 2
        if daysRented > 2 {
            charge += Double((daysRented - 2)) * 1.5
        }
        return charge
    }
    func getFrequentRenterPoint(daysRented: Int) -> Int {
        return 1
    }
}
