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
        var totalAmount: Double = 0
        var frequentRenterPoints: Int = 0
        
        var result: String = "Rental Record for " + "\(getName())" + "\n"
        for rental in self.rentals {
            var thisAmount: Double = 0
            switch rental.getMovie().getPriceCode() {
            case Movie.REGULAR:
                thisAmount += 2
                if rental.getDaysRented() > 2 {
                    thisAmount += Double((rental.getDaysRented() - 2)) * 1.5
                }
            case Movie.NEW_RELEASE:
                thisAmount += Double(rental.getDaysRented()) * 3.0
            case Movie.CHILDRENS:
                thisAmount += 1.5
                if rental.getDaysRented() > 3 {
                    thisAmount += Double((rental.getDaysRented() - 3)) * 1.5
                }
            default:
                break
            }
            
            frequentRenterPoints += 1
            
            if rental.getMovie().getPriceCode() == Movie.NEW_RELEASE && rental.getDaysRented() > 1{
                frequentRenterPoints += 1
            }
            
            result += "\t" + rental.getMovie().getTitle() + "\t" + "\(thisAmount)" + "\n"
            totalAmount += thisAmount
        }
        
        result += "Amount owed is " + "\(totalAmount)" + "\n"
        result += "You earned " + "\(frequentRenterPoints)" + " frequent renter points"
        return result
    }
}
