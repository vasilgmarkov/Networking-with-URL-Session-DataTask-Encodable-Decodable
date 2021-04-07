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
        
        createPost()
        
    }
    
    func createPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Could not be a url")
        }
        
        let newPost = Post(id: 101, title: "Encodable Title", body: "This data was created using the encodable format")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(newPost)
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in

            if let error = error {
                print("There was an error \(error.localizedDescription)")
            } else {
                let post = try? JSONDecoder().decode(Post.self, from: data!)
                
                print("The title is: \(post?.title)")
                print("The body is: \(post?.body)")
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

