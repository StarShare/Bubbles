
import Foundation

public func titan_log(_ item: String, identifier: String = "Titan") {
  ModuleLogger.shared.log(item, identifier: identifier)
}

public func titan_logItems(_ items: [String], identifier: String = "Titan") {
  ModuleLogger.shared.logItems(items, identifier: identifier)
}

public final class ModuleLogger {
  
  static let shared = ModuleLogger()
  public let isVerbose: Bool
  
  fileprivate let loggerId = "Module_Logger"
  fileprivate let dateFormatString = "dd/MM/yyyy HH:mm:ss"
  fileprivate let dateFormatter = DateFormatter()
  fileprivate let separator = ", "
  fileprivate let terminator = "\n"
  fileprivate let cURLTerminator = "\\\n"
  fileprivate let output: (_ separator: String, _ terminator: String, _ items: Any...) -> Void
  
  public init(verbose: Bool = true,
              output: ((_ separator: String, _ terminator: String, _ items: Any...) -> Void)? = nil) {
    self.isVerbose = verbose
    self.output = output ?? ModuleLogger.reversedPrint
  }
  
  fileprivate func log(_ item: String, identifier: String) {
    logItems([item], identifier: identifier)
  }
  
  fileprivate func logItems(_ items: [String], identifier: String) {
    
    var outputItems = [String]()
    outputItems = items.map { message -> String in
      format(loggerId, date: date, identifier: identifier, message: message)
    }
    
    if isVerbose {
      outputItems.forEach { output(separator, terminator, $0) }
    } else {
      output(separator, terminator, outputItems)
    }
  }
}

private extension ModuleLogger {
  
  var date: String {
    dateFormatter.dateFormat = dateFormatString
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: Date())
  }
  
  func format(_ loggerId: String, date: String, identifier: String, message: String) -> String {
    return "\(loggerId): [\(date)] \(identifier): \(message)"
  }
}

fileprivate extension ModuleLogger {
  static func reversedPrint(_ separator: String, terminator: String, items: Any...) {
    for item in items {
      print(item, separator: separator, terminator: terminator)
    }
  }
}
