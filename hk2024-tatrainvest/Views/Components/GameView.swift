import SwiftUI

struct GameView: View {
    @State private var portfolio = Portfolio(balance: 300, stocks: [:])
    @State private var hour = 0
    // Example stock data
    let stocks = ["AAPL": 150.0, "GOOG": 2000.0, "MSFT": 300.0]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hour: \(hour):00")
            Text("Balance: $\(portfolio.balance, specifier: "%.2f")")
            Text("Stocks:")
            ForEach(portfolio.stocks.sorted(by: { $0.key < $1.key }), id: \.key) { symbol, quantity in
                Text("\(symbol): \(quantity)")
            }
            HStack(spacing: 20) {
                Button("Buy AAPL") {
                    buyStock(symbol: "AAPL", quantity: 1)
                }
                Button("Sell AAPL") {
                    sellStock(symbol: "AAPL", quantity: 1)
                }
                Button("Next Hour") {
                    hour += 1
                }
            }
        }
        .padding()
    }
    
    func buyStock(symbol: String, quantity: Int) {
        guard let stockPrice = stocks[symbol] else { return }
        let totalCost = stockPrice * Double(quantity)
        if totalCost <= portfolio.balance {
            portfolio.balance -= totalCost
            portfolio.stocks[symbol, default: 0] += quantity
        }
    }
    
    func sellStock(symbol: String, quantity: Int) {
        guard let stockPrice = stocks[symbol], let currentQuantity = portfolio.stocks[symbol], currentQuantity >= quantity else { return }
        let totalSale = stockPrice * Double(quantity)
        portfolio.balance += totalSale
        portfolio.stocks[symbol, default: 0] -= quantity
        if portfolio.stocks[symbol] == 0 {
            portfolio.stocks.removeValue(forKey: symbol)
        }
    }
}

struct Portfolio {
    var balance: Double
    var stocks: [String: Int]
}
