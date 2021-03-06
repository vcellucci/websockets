//
//  WebSocketStateIdle.swift
//  WebSockets
//
//  Created by Vittorio Cellucci on 12/20/18.
//  Copyright © 2018 Vittorio Cellucci. All rights reserved.
//

import Foundation
import os

class  WebSocketStateIdle: WebSocketState {
    var inputStream: InputStream?
    var outputStream: OutputStream?
    var url: URL?
    
    var webSocketStateUtils: WebSocketStateUtils?
    
    func didReceiveData() -> WebSocketTransition {
        return .None
    }
    
    func canWriteData() -> WebSocketTransition {
        return .None
    }
    
    func getState() -> WebSocketTransition {
        return .Idle
    }
    
    func send(bytes data: [UInt8], binary isBinary: Bool) -> WebSocketTransition {
        return .None
    }
    
    func enter() {
        os_log(.debug, "Websocket is now idle...")
    }
    
    func streamClosed(stream s: Stream) ->WebSocketTransition {
        return .None
    }
    
    func ping() {
        os_log(.info, "Sending ping while idle.  Ping will not be sent.")
    }
    
    func openWriteStream(binary isbinary: Bool) -> WebSocketOutputStream {
        os_log(.info, "Trying to open an output stream in idle state.")
        return NilWebSocketOutputStreamImpl()
    }
    
    
}
