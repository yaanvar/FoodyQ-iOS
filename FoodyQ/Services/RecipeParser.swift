import Foundation

enum InstructionsParser {
    static func parse(instruction: String) -> [String] {
        let arrayWithOutStep = instruction.split(separator: /\s*(S|s)(T|t)(E|e)(P|p)\s*\d*\s*/).map(String.init)
        return arrayWithOutStep.joined(separator: " ").split(separator: /\.\s*/).map(String.init)
    }
}
