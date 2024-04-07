//
//  OpenAIService.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 07/04/2024.
//

import Foundation
import Alamofire
import Combine

class OpenAIService {
    let baseUrl = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
        let body = OpenAICompletionsBody(model: "gpt-3.5-turbo", prompt: message, temperature: 0.7)
        let headers: HTTPHeaders = [
            //"Authorization": ""
        ]
        print("Set up headers")
        
        return Future { [weak self]promise in
            guard let self = self else { return }
            
            print("sent request")
            
            AF.request(self.baseUrl, method: .post, parameters: body, encoder: .json,headers: headers).responseDecodable(of: OpenAICompletionsResponse.self) { response in
                switch response.result {
                case .success(let result):
                    print(response)
                    promise(.success(result))
                case .failure(let error):
                    print(error)
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    struct OpenAICompletionsBody: Encodable {
        let model: String
        let prompt: String
        let temperature: Float?
    }
    
    struct OpenAICompletionsResponse: Decodable {
        let id: String
        let choices: [OpenAICompletionsChoice]
    }
    
    struct OpenAICompletionsChoice: Decodable {
        let text: String
    }
}
