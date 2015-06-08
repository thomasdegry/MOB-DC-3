// Assignment 8 playground

import XCPlayground
import Foundation
import SwiftyJSON

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=nyc,ny") {
    let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        let json = JSON(data: data)
        dispatch_async(dispatch_get_main_queue(), {
            if let weatherDescript = json["weather"][0]["description"].string {
                if let temp = json["main"]["temp"].float {
                    self.textView.text = weatherDescript + ". Temperature in Fahrenheit is \(temp)"
                }
            }
        })
    })
    task.resume()
}
