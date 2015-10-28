/*
Napiši razred, ki predstavlja denarno enoto, katero bo pretvarjal drug razred. Razred ima le eno lastnost, ki označuje tip enote (npr. EUR, USD, …). Napiši še en razred, ki predstavlja pretvornik enot. Razred naj ima metodo, ki sprejme vrednost in enoto v kateri je vrednost ter instanco razreda enote, v katero naj vrednost pretvori. Metoda naj vrača tuple: pretvorjeno vrednost in tečaj, katerega je pretvornik uporabil. Metoda izgleda nekaj podobnega:
*/

import UIKit


func ==(lhs: Currency, rhs:Currency) -> Bool {
    return lhs.currency == rhs.currency && lhs.exchangeRate == rhs.exchangeRate
}

func <(lhs: Currency, rhs:Currency) -> Bool {
    return lhs.exchangeRate < rhs.exchangeRate
}

class Currency: Equatable, Comparable {
    var currency: String
    var exchangeRate: Double
    
    init(currency: String, exchangeRate: Double) {
        self.currency = currency
        self.exchangeRate = exchangeRate
    }
}

class ConverterBrain {
    
    static let sharedConverter = ConverterBrain()
    private init() {}
    
    func convert(value: Double, targetCurrency: Currency) -> (convertedValue: Double,
        targetCurrency: String)? {
            
        let eur2x = targetCurrency.exchangeRate
        
        return(value * eur2x, "Exchange Rate: EUR2" + targetCurrency.currency + " \(eur2x)")
        
    }
}

extension Double {
    func convertDouble(valute: Currency) -> (Double, String)? {
        if let x = ConverterBrain.sharedConverter.convert(self, targetCurrency: valute) {
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

