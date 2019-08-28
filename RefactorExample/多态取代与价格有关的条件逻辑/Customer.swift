//
//  Customer.swift
//  RefactorExample
//
//  Created by 张鹏宇 on 2019/8/28.
//  Copyright © 2019 Wanye1121. All rights reserved.
//

import UIKit

class Customer: NSObject {
    private let name: String
    private var rentals:[Rental] = [Rental]()
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(arg: Rental) {
        self.rentals.append(arg)
    }
    func getName() -> String {
        return self.name
    }
    
    func statement() -> String {
        var result: String = "Rental Record for " + "\(getName())" + "\n"
        
        for rental in self.rentals {
            result += "\t" + rental.getMovie().getTitle() + "\t" + "\(rental.getCharge())" + "\n"
        }
        
        result += "Amount owed is " + "\(getTotalCharge())" + "\n"
        result += "You earned " + "\(getTotalFrequentRenterPoints())" + " frequent renter points"
        return result
    }
    
    func htmlStatement() -> String {
        var result: String = "<h1><em>\(self.name)</em>的租赁账单:</h1>\n"
        
        for rental:Rental in self.rentals {
            //展示result
            result += "\(rental.getMovie().title):\(rental.getCharge())</br>\n"
        }
        
        result += "<p>总金额为：<em>\(getTotalCharge())</em></p>\n"
        result += "<p>你本次出借获取的积分为：<em>\(getTotalFrequentRenterPoints())</em></p>"
        
        return result
    }
    
    func getTotalCharge() -> Double {
        var result: Double = 0
        for rental in self.rentals {
            result += rental.getCharge()
        }
        return result
    }
    
    func getTotalFrequentRenterPoints() -> Int {
        var result: Int = 0
        for rental in self.rentals {
            result += rental.getFrequentRenterPoint()
        }
        return result
    }
    
    func amountFor(_ rental: Rental) -> Double {
        var amount: Double = 0
        switch rental.getMovie().getPriceCode() {
        case Movie.REGULAR:
            amount += 2
            if rental.getDaysRented() > 2 {
                amount += Double((rental.getDaysRented() - 2)) * 1.5
            }
        case Movie.NEW_RELEASE:
            amount += Double(rental.getDaysRented()) * 3.0
        case Movie.CHILDRENS:
            amount += 1.5
            if rental.getDaysRented() > 3 {
                amount += Double((rental.getDaysRented() - 3)) * 1.5
            }
        default:
            break
        }
        return amount
    }
}
