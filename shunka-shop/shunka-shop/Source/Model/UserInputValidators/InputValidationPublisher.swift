//
//  InputValidationPublisher.swift
//  shunka-shop
//
//  Created by Igor Drljic on 16.7.21..
//

import Foundation
import Combine

class InputValidationPublisher<Upstream: Publisher, In, Out>: Publisher
where Upstream.Output == In,
      Upstream.Failure == Never {
    
    typealias Input = In
    typealias Output = ValidationResult<Out>
    typealias Failure = Never
    
    private let upstream: Upstream
    private let validate: (Input, @escaping  (Output) -> Void) -> Void
    
    init(upstream: Upstream, validate: @escaping (Input, @escaping (Output) -> Void) -> Void) {
        self.upstream = upstream
        self.validate = validate
    }
    
    // MARK: - Publisher
    
    func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let inner = Inner<S>(downstream: subscriber, validate: validate)
        upstream.subscribe(inner)
    }
}

extension InputValidationPublisher {
    final private class Inner<Downstream: Subscriber>: Subscription, Subscriber
    where Upstream.Output == InputValidationPublisher.Input,
          Upstream.Failure == InputValidationPublisher.Failure,
          Downstream.Input == InputValidationPublisher.Output,
          Downstream.Failure == InputValidationPublisher.Failure {
    
        typealias Input = InputValidationPublisher.Input
        typealias Failure = InputValidationPublisher.Failure
        
        private let validate: (Input, @escaping (Output) -> Void) -> Void
        private let downstream: Downstream
        private var subscription: Subscription?
        
        init(downstream: Downstream, validate: @escaping (Input, @escaping (Output) -> Void) -> Void) {
            self.downstream = downstream
            self.validate = validate
        }
        
        // MARK: - Subscription
        
        func request(_ demand: Subscribers.Demand) {
            subscription?.request(demand)
        }
        
        func cancel() {
            let subscription = self.subscription
            self.subscription = nil
            subscription?.cancel()
        }
        
        // MARK: - Subscriber
        
        func receive(subscription: Subscription) {
            guard self.subscription == nil else {
                subscription.cancel()
                return
            }
            self.subscription = subscription
            downstream.receive(subscription: subscription)
        }
        
        func receive(_ input: Upstream.Output) -> Subscribers.Demand {
            self.validate(input) { result in
                _ = self.downstream.receive(result)
            }
            return .unlimited
        }
        
        func receive(completion: Subscribers.Completion<Upstream.Failure>) {
            downstream.receive(completion: completion)
        }
    }
}
