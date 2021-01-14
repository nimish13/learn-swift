import UIKit

extension String {
    func isPalindrome() -> Bool {
        self == String(self.reversed())
    }
}

func checkPalindrome(for string: String?) -> String {
    if let stringValue = string, !stringValue.isEmpty {
        return stringValue.isPalindrome() ? "String is a palindrome" : "String is not a palindrome"
    } else {
        return "Please provide a value"
    }
}


checkPalindrome(for: "nimish")

checkPalindrome(for: "")

checkPalindrome(for: nil)

checkPalindrome(for: "madam")
