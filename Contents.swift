/**
 
 * Homework 3
 * Jim Mittler
 * 25 August 2025
 
 perform Kelvin, Celsius, Farenheit conersions via lambdas and higher order functions.
 We decided to use Int for args and return Doubles.
 
 _Italic text_
 __Bold text__
 ~~Strikethrough text~~

 */


import Cocoa


// This function is named 'convertTemperature'.
// temperature is the first parameter which is an Int. The underscore simplifies the call so you don't need add a label
//  '(using conversionFunction: (Int) -> Double)': This is the second parameter. A lambda that takes an Int, returns a Dopuble.
//
//  At the end, This function will return an Double value after the conversion.

func convertTemperature(_ temperature: Int, using conversionFunction: (Int) -> Double) -> Double {
    return conversionFunction(temperature)
}

// This closure "c2f" converts Celsius to Fahrenheit.
// - On the left of the assignment operator (=): 'c2f' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(celsius: Int)' defines the closure's parameter list.
//   It takes one parameter named 'celsius' of type 'Int'.
// - After the '->' symbol: 'Double' specifies the closure's return type.
//   This closure will return a double value in Fahrenheit.

let c2f = { (celsius: Int) -> Double in
    // Calculate Fahrenheit temperature using the formula: (celsius * 9 / 5) + 32.
    return Double(celsius) * 9 / 5 + 32
}

// This closure "f2c" converts Fahrenheit to Celsius.
// - On the left of the assignment operator (=): 'f2c' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(fahrenheit: Int)' defines the closure's parameter list.
//   It takes one parameter named 'fahrenheit' of type 'Double'.
// - After the '->' symbol: 'Int' specifies the closure's return type.
//   This closure will return an Double value in Celsius.


let f2c = { (fahrenheit: Int) -> Double in
    // Calculate Celsius temperature using the formula: (fahrenheit - 32) * 5 / 9.
    return (Double(fahrenheit) - 32) * 5 / 9
}


// This closure "c2k" converts Celsius to Kelvin.
// - On the left of the assignment operator (=): 'c2k' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(celsius: Int)' defines the closure's parameter list.
//   It takes one parameter named 'celsius' of type 'Double'.
// - After the '->' symbol: 'Double' specifies the closure's return type.
//   This closure will return an Double value in Kelvin.



let c2k = { (celsius: Int) -> Double in
    return Double(celsius) + 273.15
}

// This closure "k2c" converts Kelvin to Celsius.
// - On the left of the assignment operator (=): 'k2c' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(celsius: Double)' defines the closure's parameter list.
//   It takes one parameter named 'celsius' of type 'Double'.
// - After the '->' symbol: 'Double' specifies the closure's return type.
//   This closure will return an Double value.


let k2c = { (kelvin: Int) -> Double in
    return Double(kelvin) - 273.15
}

// This closure "k2f" converts Kelvin to Fahrenheit.
// - On the left of the assignment operator (=): 'k2f' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(celsius: Double)' defines the closure's parameter list.
//   It takes one parameter named 'celsius' of type 'Double'.
// - After the '->' symbol: 'Int' specifies the closure's return type.
//   This closure will return an Double value.

let k2f = { (kelvin: Int) -> Double in
    return (Double(kelvin) - 273.15) * 9/5 + 32
}

// This closure "f2k" converts Fahrenheit to Kelvin.
// - On the left of the assignment operator (=): 'f2k' is the constant name to which this closure is assigned.
// - Before the '->' symbol: '(fahrenheit: Int)' defines the closure's parameter list.
//   It takes one parameter named 'fahrenheit' of type 'Int'.
// - After the '->' symbol: 'Double' specifies the closure's return type.
//   This closure will return an Double value in Kelvin.

let f2k = { (fahrenheit: Int) -> Double in
    return (Double(fahrenheit) - 32) * 5/9 + 273.15
}

// we start our output here...

// call directly
let fahrenheit = c2f(25)
print("(direct) 25°C is \(fahrenheit)°F")

// call directly

let celsius = f2c(77)
print("(direct) 77°F is \(celsius)°C")

// use the higher order function

let tempInF = convertTemperature(25, using: c2f)
print("25°C = \(tempInF)°F")

let tempInC = convertTemperature(77, using: f2c)
print("77°F = \(tempInC)°C")

// Celsius to Kelvin
let tempInK = convertTemperature(0, using: c2k)
print("O°C = \(tempInK)K") // Expected output: 0°C ≈ 273K

// Kelvin to Celsius
let tempInC2 = convertTemperature(273, using: k2c)
print("273K = \(tempInC2)°C") // Expected output: 273K ≈ O°C

// Fahrenheit to Kelvin
let tempInK_fromF = convertTemperature(32, using: f2k)
print("32°F = \(tempInK_fromF)K") // Expected output: 32°F ≈ 273K

// Kelvin to Fahrenheit
let tempInF_fromK = convertTemperature(300, using: k2f)
print("300K = \(tempInF_fromK)°F") // Expected output: 300K ≈ 80°F
