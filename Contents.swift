/**

 * Homework 3
 * Jim Mittler
 * 25 August 2025

 perform Kelvin, Celsius, Farenheit conversions via lambdas and higher order functions.
 We decided to use Int for args and return Doubles rounded to two digits

 wrapped up with a test case runner

 _Italic text_
 __Bold text__
 ~~Strikethrough text~~

 */

import XCTest

class Temperature {

    // This function is named 'convertTemperature'.
    // temperature is the first parameter which is an Int. The underscore simplifies the call so you don't need add a label
    //  '(using conversionFunction: (Int) -> Double)': This is the second parameter. A lambda that takes an Int, returns a Dopuble.
    //
    //  At the end, This function will return an Double value rounded to two digits after the conversion.

    func convertTemperature(
        _ temperature: Int,
        using conversionFunction: (Int) -> Double
    ) -> Double {
        return round(conversionFunction(temperature) * 100) / 100.0
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
        return (Double(kelvin) - 273.15) * 9 / 5 + 32
    }

    // This closure "f2k" converts Fahrenheit to Kelvin.
    // - On the left of the assignment operator (=): 'f2k' is the constant name to which this closure is assigned.
    // - Before the '->' symbol: '(fahrenheit: Int)' defines the closure's parameter list.
    //   It takes one parameter named 'fahrenheit' of type 'Int'.
    // - After the '->' symbol: 'Double' specifies the closure's return type.
    //   This closure will return an Double value in Kelvin.

    let f2k = { (fahrenheit: Int) -> Double in
        return (Double(fahrenheit) - 32) * 5 / 9 + 273.15
    }
}

// heres our test case runner that will print output

class TemperatureTests: XCTestCase {

    // call directly

    func testDirect() {
        let temp = Temperature()
        // call directly
        let celsius = temp.f2c(77)
        print("(direct) 77°F is \(celsius)°C")
        XCTAssertEqual(celsius, 25, "f2c failed: 77°F should be 25.0")

        let tempInF = temp.convertTemperature(25, using: temp.c2f)
        print("25°C = \(tempInF)°F")
        XCTAssertEqual(tempInF, 77.0, "c2f failed: 25°C should be 77.0")
    }

    // test with higher order functions

    func testHigherOrder() {

        let temp = Temperature()

        let tempInC = temp.convertTemperature(77, using: temp.f2c)
        print("77°F = \(tempInC)°C")
        XCTAssertEqual(tempInC, 25.0, "f2c failed: should be 25.0")

        // Celsius to Kelvin
        let tempInK = temp.convertTemperature(0, using: temp.c2k)
        print("O°C = \(tempInK)K")  // Expected output: 0°C ≈ 273K
        XCTAssertEqual(tempInK, 273.15, "c2k failed: should be 273.15")

        // Kelvin to Celsius
        let tempInC2 = temp.convertTemperature(273, using: temp.k2c)
        print("273K = \(tempInC2)°C")  // Expected output: 273K ≈ O°C
        XCTAssertEqual(tempInC2, -0.15, "k2c failed: should be -0.15")

        // Fahrenheit to Kelvin
        let tempInK_fromF = temp.convertTemperature(32, using: temp.f2k)
        print("32°F = \(tempInK_fromF)K")  // Expected output: 32°F ≈ 273K
        XCTAssertEqual(tempInK_fromF, 273.15, "f2k failed: should be 273.15")

        // Kelvin to Fahrenheit
        let tempInF_fromK = temp.convertTemperature(300, using: temp.k2f)
        print("300K = \(tempInF_fromK)°F")  // Expected output: 300K ≈ 80°F
        XCTAssertEqual(tempInF_fromK, 80.33, "k2f failed: should be 80.33")
    }
}

TemperatureTests.defaultTestSuite.run()
