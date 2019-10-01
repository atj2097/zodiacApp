//
//  APIClient.swift
//  zodiacApp
//
//  Created by God on 9/27/19.
//  Copyright © 2019 God. All rights reserved.
//


import Foundation

class ZodiacAPIManager {
    private init() {}

    static let shared = ZodiacAPIManager()

    func getZodiac(astroSign: String, completionHandler: @escaping (Result<Zodiac, AppError>) -> Void) {
        let urlStr = "http://sandipbgt.com/theastrologer/api/horoscope/\(astroSign)/today"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }


        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let zodiacWrapper = try JSONDecoder().decode(Zodiac.self, from: data)
                    completionHandler(.success(zodiacWrapper))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
}
}
