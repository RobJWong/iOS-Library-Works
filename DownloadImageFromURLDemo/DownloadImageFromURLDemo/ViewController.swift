//
//  ViewController.swift
//  DownloadImageFromURLDemo
//
//  Created by Robert Wong on 8/9/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        let url = URL(string: "https://images.isbndb.com/covers/26/29/9780306822629.jpg")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if (error != nil) {
                print(error)
            }
            else {
                var documentsDirectory: String?
                var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                if paths.count > 0 {
                    documentsDirectory = paths[0]
                    let savePath = documentsDirectory! + "/9780306822629.jpg"
                    FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(named: savePath)
                    }
                }
            }
        }
        task.resume()
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print("Begin of code")
//        if let url = URL(string: "https://images.isbndb.com/covers/26/29/9780306822629.jpg") {
//            imageView.contentMode = .scaleAspectFit
//            downloadImage(url: url)
//        }
//        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            completion(data, response, error)
//            }.resume()
//    }
//
//    func downloadImage(url: URL) {
//        print("Download Started")
//        getDataFromUrl(url: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() {
//                self.imageView.image = UIImage(data: data)
//            }
//        }
//    }


}

