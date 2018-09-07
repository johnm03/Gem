//
//  Coordinatable.swift
//  Gem

/// Errors produced from coordinating
enum CoordinateError: Error {
    
    /// - unsupported: The coordination was not supported.
    case unsupported(String)
    
}

/// Identifies something capable of preparing navigation i.e Dependency Injection.
protocol Coordinatable {
    
    /// Prepare the destination for navigation.
    func prepareForNavigation()
    
}

