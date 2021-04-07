//
//  ViewController.swift
//  Networking-URLDataTask
//
//  Created by vas mar on 07/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendPost()
        
    }
    
    func sendPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Could not be a url")
        }
        
        let params = [
            "title": "I am the king!",
            "body": "The king is back. Get over it faaaam"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in

            if let error = error {
                print("There was an error \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                print("The response: \(jsonRes)")
            }
            
        }.resume()
    }

    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Could not be a url")
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                print("The response: \(jsonRes)")
            }
            
        }.resume()
    }
}

