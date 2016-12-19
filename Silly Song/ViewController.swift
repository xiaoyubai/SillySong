//
//  ViewController.swift
//  Silly Song
//
//  Created by 妞儿 on 2016-12-15.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowel = Set("aeiou".characters)
    let first_letter = lowercaseName[lowercaseName.startIndex]
    if vowel.contains(first_letter) {
        return lowercaseName
    }
    return String(lowercaseName.characters.dropFirst())
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var sillySong = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    sillySong = sillySong.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    return sillySong
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    //obj?.fn() calls fn member function if the object isn't null, otherwise doesn't do anything.
    //obj!.fn() on the other hand asserts that obj isn't null, and calls fn. If the object is null, you get an exception.
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
}

