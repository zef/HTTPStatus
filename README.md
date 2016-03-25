# HTTPStatus.swift

A Swift struct for working with HTTP status codes. Part of the [Fly](https://github.com/zef/Fly) framework.

HTTPStatus provides named constants for the status codes you are likely to need:

`HTTPStatus.OK`, `HTTPStatus.NotFound`, `HTTPStatus.InternalServerError`, and [many more](https://github.com/zef/HTTPStatus/blob/master/Sources/HTTPStatus.swift#L128).


To use the provided status codes:

```Swift
var internalError = HTTPStatus.InternalServerError

// Since the type is known, we can omit `HTTPStatus` and use type inferrence:
internalError = .InternalServerError

// You can also assign a value with a status code number diretly due to `IntegerLiteralConvertible`:
internalError = 500

// But be careful! The code use use as a literal must be valid or the app will crash!
// A valid code is considered to be anything in the range of 100 through 599
let crashy: HTTPStatus = 99
// precondition failed: Status Code must be between 100 and 599
```

However, if you need to use a status code that is not predefined, you can do so:

```Swift
// returns an optional, only nil if the status code is outside of the valid range.
HTTPStatus(code: 199, message: "Very Informational Thing")

// returns non-optional HTTPStatus
// but will crash with `precondition failed` if the code is outside of the valid range
HTTPStatus(safeCode: 199, message: "Very Informational Thing")
```

## Additional features

HTTPStatus is `Equatable`:

```Swift
print(HTTPStatus.OK == 200) // true
print(.NotFound == 500) // false
//    ^ Swift can even infer the type without extra context here :)
```

HTTPStatus is `CustomStringConvertible`:

```Swift
String(HTTPStatus.InternalServerError) // "500 Internal Server Error"
"\(HTTPStatus.NotFound)" // "404 Not Found"
```


HTTPStatus is `Hashable` so it can be used as a dictionary key.

```Swift
let statusDictionary: [HTTPStatus: String]
```

## TODO:

- [ ] Add classification enum and logic to represent the different status type ranges



