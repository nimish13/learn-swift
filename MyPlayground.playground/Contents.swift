import UIKit

extension String {
    func isPalindrome() -> Bool {
        self == String(self.reversed())
    }
}

func checkPalindrome(for string: String?) -> String {
    if let stringValue = string, !stringValue.isEmpty {
        return stringValue.isPalindrome() ? "Input String is a palindrome" : "Input String is not a palindrome"
    } else {
        return "Please provide an input"
    }
}


checkPalindrome(for: "nimish")

checkPalindrome(for: "")

checkPalindrome(for: nil)

checkPalindrome(for: "madam")
