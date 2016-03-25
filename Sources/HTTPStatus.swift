public struct HTTPStatus {
    public let code: Int
    public var customMessage: String?
    public var message: String {
        return HTTPStatus.messages[code] ?? customMessage ?? "Unknown"
    }

    public init(safeCode code: Int, message: String? = nil) {
        precondition(HTTPStatus.codeIsValid(code), "Status Code must be between 100 and 599")
        self.code = code
        self.customMessage = message
    }

    public init?(code: Int, message: String? = nil) {
        guard HTTPStatus.codeIsValid(code) else { return nil  }
        self.code = code
        self.customMessage = message
    }

    static func codeIsValid(code: Int) -> Bool {
        return 100...599 ~= code
    }

    static var messages = [
        100: "Continue",
        101: "Switching Protocols",
        102: "Processing",

        200: "OK",
        201: "Created",
        202: "Accepted",
        203: "Non-Authoritative Information",
        204: "No Content",
        205: "Reset Content",
        206: "Partial Content",
        207: "Multi-Status",
        208: "Already Reported",
        226: "IM Used",

        300: "Multiple Choices",
        301: "Moved Permanently",
        302: "Found",
        303: "See Other",
        304: "Not Modified",
        305: "Use Proxy",
        306: "Switch Proxy",
        307: "Temporary Redirect",
        308: "Permanent Redirect",

        400: "Bad Request",
        401: "Unauthorized",
        402: "Payment Required",
        403: "Forbidden",
        404: "Not Found",
        405: "Method Not Allowed",
        406: "Not Acceptable",
        407: "Proxy Authentication Required",
        408: "Request Timeout",
        409: "Conflict",
        410: "Gone",
        411: "Length Required",
        412: "Precondition Failed",
        413: "Payload Too Large",
        414: "URI Too Long",
        415: "Unsupported Media Type",
        416: "Range Not Satisfiable",
        417: "Expectation Failed",
        418: "Im A Teapot",
        419: "Authentication Timeout",
        421: "Misdirected Request",
        422: "Unprocessable Entity",
        423: "Locked",
        424: "Failed Dependency",
        426: "Upgrade Required",
        428: "Precondition Required",
        429: "Too Many Requests",
        431: "Request Header Fields Too Large",
        440: "Login Timeout",
        444: "No Response",
        449: "Retry With",
        451: "Unavailable For Legal Reasons",
        494: "Request Header Too Large",
        495: "Cert Error",
        496: "No Cert",
        497: "HTTP To HTTPS",
        498: "Token Expired",
        499: "Client Closed Request",

        500: "Internal Server Error",
        501: "Not Implemented",
        502: "Bad Gateway",
        503: "Service Unavailable",
        504: "Gateway Timeout",
        505: "HTTP Version Not Supported",
        506: "Variant Also Negotiates",
        507: "Insufficient Storage",
        508: "Loop Detected",
        509: "Bandwidth Limit Exceeded",
        510: "Not Extended",
        511: "Network Authentication Required",
        599: "Network Timeout Error"
    ]
}

extension HTTPStatus: IntegerLiteralConvertible {
    public init(integerLiteral: Int) {
        self.init(safeCode: integerLiteral)
    }
}

extension HTTPStatus: CustomStringConvertible {
    public var description: String {
        return "\(code) \(message)"
    }
}

public func == (left: HTTPStatus, right: HTTPStatus) -> Bool {
    return left.code == right.code
}

extension HTTPStatus {
    static let Continue                      = HTTPStatus(safeCode: 100)
    static let SwitchingProtocols            = HTTPStatus(safeCode: 101)
    static let Processing                    = HTTPStatus(safeCode: 102)

    static let OK                            = HTTPStatus(safeCode: 200)
    static let Created                       = HTTPStatus(safeCode: 201)
    static let Accepted                      = HTTPStatus(safeCode: 202)
    static let NonAuthoritativeInformation   = HTTPStatus(safeCode: 203)
    static let NoContent                     = HTTPStatus(safeCode: 204)
    static let ResetContent                  = HTTPStatus(safeCode: 205)
    static let PartialContent                = HTTPStatus(safeCode: 206)
    static let MultiStatus                   = HTTPStatus(safeCode: 207)
    static let AlreadyReported               = HTTPStatus(safeCode: 208)
    static let IMUsed                        = HTTPStatus(safeCode: 226)

    static let MultipleChoices               = HTTPStatus(safeCode: 300)
    static let MovedPermanently              = HTTPStatus(safeCode: 301)
    static let Found                         = HTTPStatus(safeCode: 302)
    static let SeeOther                      = HTTPStatus(safeCode: 303)
    static let NotModified                   = HTTPStatus(safeCode: 304)
    static let UseProxy                      = HTTPStatus(safeCode: 305)
    static let SwitchProxy                   = HTTPStatus(safeCode: 306)
    static let TemporaryRedirect             = HTTPStatus(safeCode: 307)
    static let PermanentRedirect             = HTTPStatus(safeCode: 308)

    static let BadRequest                    = HTTPStatus(safeCode: 400)
    static let Unauthorized                  = HTTPStatus(safeCode: 401)
    static let PaymentRequired               = HTTPStatus(safeCode: 402)
    static let Forbidden                     = HTTPStatus(safeCode: 403)
    static let NotFound                      = HTTPStatus(safeCode: 404)
    static let MethodNotAllowed              = HTTPStatus(safeCode: 405)
    static let NotAcceptable                 = HTTPStatus(safeCode: 406)
    static let ProxyAuthenticationRequired   = HTTPStatus(safeCode: 407)
    static let RequestTimeout                = HTTPStatus(safeCode: 408)
    static let Conflict                      = HTTPStatus(safeCode: 409)
    static let Gone                          = HTTPStatus(safeCode: 410)
    static let LengthRequired                = HTTPStatus(safeCode: 411)
    static let PreconditionFailed            = HTTPStatus(safeCode: 412)
    static let PayloadTooLarge               = HTTPStatus(safeCode: 413)
    static let URITooLong                    = HTTPStatus(safeCode: 414)
    static let UnsupportedMediaType          = HTTPStatus(safeCode: 415)
    static let RangeNotSatisfiable           = HTTPStatus(safeCode: 416)
    static let ExpectationFailed             = HTTPStatus(safeCode: 417)
    static let ImATeapot                     = HTTPStatus(safeCode: 418)
    static let AuthenticationTimeout         = HTTPStatus(safeCode: 419)
    static let MisdirectedRequest            = HTTPStatus(safeCode: 421)
    static let UnprocessableEntity           = HTTPStatus(safeCode: 422)
    static let Locked                        = HTTPStatus(safeCode: 423)
    static let FailedDependency              = HTTPStatus(safeCode: 424)
    static let UpgradeRequired               = HTTPStatus(safeCode: 426)
    static let PreconditionRequired          = HTTPStatus(safeCode: 428)
    static let TooManyRequests               = HTTPStatus(safeCode: 429)
    static let RequestHeaderFieldsTooLarge   = HTTPStatus(safeCode: 431)
    static let LoginTimeout                  = HTTPStatus(safeCode: 440)
    static let NoResponse                    = HTTPStatus(safeCode: 444)
    static let RetryWith                     = HTTPStatus(safeCode: 449)
    static let UnavailableForLegalReasons    = HTTPStatus(safeCode: 451)
    static let RequestHeaderTooLarge         = HTTPStatus(safeCode: 494)
    static let CertError                     = HTTPStatus(safeCode: 495)
    static let NoCert                        = HTTPStatus(safeCode: 496)
    static let HTTPToHTTPS                   = HTTPStatus(safeCode: 497)
    static let TokenExpired                  = HTTPStatus(safeCode: 498)
    static let ClientClosedRequest           = HTTPStatus(safeCode: 499)

    static let InternalServerError           = HTTPStatus(safeCode: 500)
    static let NotImplemented                = HTTPStatus(safeCode: 501)
    static let BadGateway                    = HTTPStatus(safeCode: 502)
    static let ServiceUnavailable            = HTTPStatus(safeCode: 503)
    static let GatewayTimeout                = HTTPStatus(safeCode: 504)
    static let HTTPVersionNotSupported       = HTTPStatus(safeCode: 505)
    static let VariantAlsoNegotiates         = HTTPStatus(safeCode: 506)
    static let InsufficientStorage           = HTTPStatus(safeCode: 507)
    static let LoopDetected                  = HTTPStatus(safeCode: 508)
    static let BandwidthLimitExceeded        = HTTPStatus(safeCode: 509)
    static let NotExtended                   = HTTPStatus(safeCode: 510)
    static let NetworkAuthenticationRequired = HTTPStatus(safeCode: 511)
    static let NetworkTimeoutError           = HTTPStatus(safeCode: 599)
}

