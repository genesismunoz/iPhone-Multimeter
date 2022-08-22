//
//  feedbackpagee.swift
//  STEVE
//
//  Created by Genesis Muñoz.
//

import Foundation
import UIKit



class feedbackpagee: UIViewController{
    @IBOutlet weak var likes: UITextField!
    @IBOutlet weak var improve: UITextField!
    
    @IBAction func submitpressed(_ sender: Any) {
        let url = NSURL(string: "http://localhost:8888/feedback.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        var dataString = "secretWord=GenesisRocks!" //starting POST string with a secretWord/password
        
        //POST string entries separated by &
        dataString = dataString + "&likes=\(likes.text!)" // add items
        dataString = dataString + "&improve=\(improve.text!)"
      
        
        //Must convert the post string to utf8
        let dataD = dataString.data(using: .utf8) //converting to utf8 string
        do{
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                if(error != nil){
                    
                    //Pop-up alert if theres an error inside the DispatchQueue.main.async
                    DispatchQueue.main.async{
                            let alert = UIAlertController(title: "Upload Didn't Work", message: "Connection to the server didn't work. Please Check your Internet access.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                    }
                }
                else{
                    if let unwrappedData = data{
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        print(returnedData!)
                        if(returnedData! == "\n1\n"){// insert into database worked
                            //Pop-up alert if database insert worked confirm it was successful
                            DispatchQueue.main.async{
                                let alert = UIAlertController(title: "Feedback Submitted!", message: "Your opinion has been sent to our database.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                            //Pop-up alert if database insert didn't work
                            DispatchQueue.main.async{
                            let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not work.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
            uploadJob.resume() //resume application tasks if suspended while querying
        }
        //Reset Submission Box for new entries!
        self.likes.text = ""
        self.improve.text = ""
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
