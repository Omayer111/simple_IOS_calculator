import SwiftUI

struct ContentView: View {
    @State private var currentInput = ""      // Holds the current number being typed
    @State private var previousInput = ""     // Holds the previous number
    @State private var currentOperator: String? = nil  // Holds the operator (+, -, ×, ÷)

    var body: some View {
        ZStack {
            Image("peakpx") // Background image
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Display the result or current input
                Text(currentInput.isEmpty ? "0" : currentInput)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .frame(maxWidth: .infinity, alignment: .trailing)

                // Calculator buttons
                VStack {
                    HStack {
                        Button("7") { numberPressed("7") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("8") { numberPressed("8") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("9") { numberPressed("9") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("/") { operatorPressed("/") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                    }
                    HStack {
                        Button("4") { numberPressed("4") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("5") { numberPressed("5") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("6") { numberPressed("6") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("*") { operatorPressed("*") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                    }

                    HStack {
                        Button("1") { numberPressed("1") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("2") { numberPressed("2") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("3") { numberPressed("3") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("-") { operatorPressed("-") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                    }

                    HStack {
                        Button("0") { numberPressed("0") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("C") { clearPressed() }  // Fixed "C" button
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("=") { equalPressed() }  // Fixed "=" button
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                        Button("+") { operatorPressed("+") }
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .font(.title)
            }
            .padding()
        }
    }

    // Number button action
    private func numberPressed(_ number: String) {
        // Prevent multiple decimal points
        if number == "." && currentInput.contains(".") {
            return
        }
        currentInput += number
    }

    // Operator button action (+, -, ×, ÷)
    private func operatorPressed(_ operatorSymbol: String) {
        if !currentInput.isEmpty {
            previousInput = currentInput
            currentInput = ""
            currentOperator = operatorSymbol
        }
    }

    // Clear button action
    private func clearPressed() {
        currentInput = ""
        previousInput = ""
        currentOperator = nil
    }

    // Equal button action to calculate the result
    private func equalPressed() {
        guard let num1 = Double(previousInput),
              let num2 = Double(currentInput) else {
            currentInput = "Error"
            return
        }

        var result: Double?

        switch currentOperator {
        case "+":
            result = num1 + num2
        case "-":
            result = num1 - num2
        case "*":
            result = num1 * num2
        case "/":
            if num2 != 0 {
                result = num1 / num2
            } else {
                currentInput = "Error"
                return
            }
        default:
            break
        }

        if let resultValue = result {
            currentInput = "\(resultValue)"
        }

        previousInput = ""
        currentOperator = nil
    }
}

#Preview {
    ContentView()
}
