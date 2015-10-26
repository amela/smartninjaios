/*
Napiši razred, ki predstavlja denarno enoto, katero bo pretvarjal drug razred. Razred ima le eno lastnost, ki označuje tip enote (npr. EUR, USD, …). Napiši še en razred, ki predstavlja pretvornik enot. Razred naj ima metodo, ki sprejme vrednost in enoto v kateri je vrednost ter instanco razreda enote, v katero naj vrednost pretvori. Metoda naj vrača tuple: pretvorjeno vrednost in tečaj, katerega je pretvornik uporabil. Metoda izgleda nekaj podobnega:
*/

import UIKit

protocol Comparable {
    func compare () -> String
}

class Currency: Comparable {
    var currency: String
    
    init(currency: String) {
        self.currency = currency
    }
    
    func compare () -> String {
        return(String(ConverterBrain.sharedConverter.exchangeRate["EUR2" + self.currency]))
    }
}

class ConverterBrain {
    
    static let sharedConverter = ConverterBrain()
    private init() {}

    let exchangeRate = ["EUR2USD": 1.13585, "EUR2EUR": 1.0, "EUR2JPY": 136.044562]
    
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
            print("Not supported.")
            return nil
        }
    }
}

extension Double {
    func convertDouble(valute: Currency) -> (Double, String)? {
        if let x = ConverterBrain.sharedConverter.convert(self, startCurrency: "EUR", targetCurrency: valute) {
            return x
        }
        return nil
    }
}

//Test cases
//let simpleConverter = ConverterBrain()

//let eurInstance = Currency(currency:"EUR")
//let usdInstance = Currency(currency:"USD")

//let test = simpleConverter.convert(200.0, startCurrency:"USD", targetCurrency:eurInstance)
//let test2 = simpleConverter.convert(200.0, startCurrency:"EUR", targetCurrency:usdInstance)

