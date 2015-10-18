/*
Napiši razred, ki predstavlja denarno enoto, katero bo pretvarjal drug razred. Razred ima le eno lastnost, ki označuje tip enote (npr. EUR, USD, …). Napiši še en razred, ki predstavlja pretvornik enot. Razred naj ima metodo, ki sprejme vrednost in enoto v kateri je vrednost ter instanco razreda enote, v katero naj vrednost pretvori. Metoda naj vrača tuple: pretvorjeno vrednost in tečaj, katerega je pretvornik uporabil. Metoda izgleda nekaj podobnega:
*/

import UIKit

class Currency {
    var currency: String
    
    init(currency: String) {
        self.currency = currency
    }
}

class Converter {

    let exchangeRate = ["EUR2USD": 1.13585]
    
    func convert(value: Double, startCurrency: String, targetCurrency: Currency) -> (convertedValue: Double, targetCurrency: String)? {
        let a2b = startCurrency + "2" + targetCurrency.currency
        let b2a = targetCurrency.currency + "2" + startCurrency
        
        if let rate = exchangeRate[a2b] {
            return(value * rate, "Exchange Rate: " + a2b + "\(rate)")
        }
        else if let rate = exchangeRate[b2a] {
            return(value * (1/rate), "Exchange Rate for " + b2a + " = " + "\(1/rate)")
        }
        else {
            print("It's the end of the world as we know it. Or bad input, or your currency is not in our repertoire.")
            return nil
        }
    }
}

// Test cases
let simpleConverter = Converter()

let eurInstance = Currency(currency:"EUR")
let usdInstance = Currency(currency:"USD")

let test = simpleConverter.convert(200.0, startCurrency:"USD", targetCurrency:eurInstance)
let test2 = simpleConverter.convert(200.0, startCurrency:"EUR", targetCurrency:usdInstance)

