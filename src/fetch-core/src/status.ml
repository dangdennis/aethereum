type informational = [ `Continue | `SwitchingProtocols | `Processing ]

type success =
  [ `OK
  | `Created
  | `Accepted
  | `NonAuthoritativeInformation
  | `NoContent
  | `ResetContent
  | `PartialContent
  | `MultiStatus
  | `AlreadyReported
  | `IMUsed ]

type redirection =
  [ `MultipleChoices
  | `MovedPermanently
  | `Found
  | `SeeOther
  | `NotModified
  | `UseProxy
  | `TemporaryRedirect
  | `PermanentRedirect ]

type client_error =
  [ `BadRequest
  | `Unauthorized
  | `PaymentRequired
  | `Forbidden
  | `NotFound
  | `MethodNotAllowed
  | `NotAcceptable
  | `ProxyAuthenticationRequired
  | `RequestTimeout
  | `Conflict
  | `Gone
  | `LengthRequired
  | `PreconditionFailed
  | `PayloadTooLarge
  | `UriTooLong
  | `UnsupportedMediaType
  | `RangeNotSatisfiable
  | `ExpectationFailed
  | `ImATeapot
  | `MisdirectedRequest
  | `UnprocessableEntity
  | `Locked
  | `FailedDependency
  | `UpgradeRequired
  | `PreconditionRequired
  | `TooManyRequests
  | `RequestHeaderFieldsTooLarge
  | `UnavailableForLegalReasons ]

type server_error =
  [ `InternalServerError
  | `NotImplemented
  | `BadGateway
  | `ServiceUnavailable
  | `GatewayTimeout
  | `HttpVersionNotSupported
  | `VariantAlsoNegotiates
  | `InsufficientStorage
  | `LoopDetected
  | `NotExtended
  | `NetworkAuthenticationRequired ]

type standard =
  [ `ClientError | `Informational | `Redirection | `ServerError | `Success ]

type t = [ standard | `Other of int ]

let to_code c =
  match c with
  (* Informational *)
  | `Continue -> 100
  | `SwitchingProtocols -> 101
  | `Processing -> 102
  (* Successful *)
  | `OK -> 200
  | `Created -> 201
  | `Accepted -> 202
  | `NonAuthoritativeInformation -> 203
  | `NoContent -> 204
  | `ResetContent -> 205
  | `PartialContent -> 206
  | `MultiStatus -> 207
  | `AlreadyReported -> 208
  | `IMUsed -> 226
  (* Redirection *)
  | `MultipleChoices -> 300
  | `MovedPermanently -> 301
  | `Found -> 302
  | `SeeOther -> 303
  | `NotModified -> 304
  | `UseProxy -> 305
  | `TemporaryRedirect -> 307
  | `PermanentRedirect -> 308
  (* Client Erro *)
  | `BadRequest -> 400
  | `Unauthorized -> 401
  | `PaymentRequired -> 402
  | `Forbidden -> 403
  | `NotFound -> 404
  | `MethodNotAllowed -> 405
  | `NotAcceptable -> 406
  | `ProxyAuthenticationRequired -> 407
  | `RequestTimeout -> 408
  | `Conflict -> 409
  | `Gone -> 410
  | `LengthRequired -> 411
  | `PreconditionFailed -> 412
  | `PayloadTooLarge -> 413
  | `UriTooLong -> 414
  | `UnsupportedMediaType -> 415
  | `RangeNotSatisfiable -> 416
  | `ExpectationFailed -> 417
  | `ImATeapot -> 418
  | `MisdirectedRequest -> 421
  | `UnprocessableEntity -> 422
  | `Locked -> 423
  | `FailedDependency -> 424
  | `UpgradeRequired -> 426
  | `PreconditionRequired -> 428
  | `TooManyRequests -> 429
  | `RequestHeaderFieldsTooLarge -> 431
  | `UnavailableForLegalReasons -> 451
  (* Server Error *)
  | `InternalServerError -> 500
  | `NotImplemented -> 501
  | `BadGateway -> 502
  | `ServiceUnavailable -> 503
  | `GatewayTimeout -> 504
  | `HttpVersionNotSupported -> 505
  | `VariantAlsoNegotiates -> 506
  | `InsufficientStorage -> 507
  | `LoopDetected -> 508
  | `NotExtended -> 510
  | `NetworkAuthenticationRequired -> 511
  | `Other c -> c

let of_code c =
  match c with
  (* Informational *)
  | 100 -> `Continue
  | 101 -> `SwitchingProtocols
  | 102 -> `Processing
  (* Successful *)
  | 200 -> `OK
  | 201 -> `Created
  | 202 -> `Accepted
  | 203 -> `NonAuthoritativeInformation
  | 204 -> `NoContent
  | 205 -> `ResetContent
  | 206 -> `PartialContent
  | 207 -> `MultiStatus
  | 208 -> `AlreadyReported
  | 226 -> `IMUsed
  (* Redirection *)
  | 300 -> `MultipleChoices
  | 301 -> `MovedPermanently
  | 302 -> `Found
  | 303 -> `SeeOther
  | 304 -> `NotModified
  | 305 -> `UseProxy
  | 307 -> `TemporaryRedirect
  | 308 -> `PermanentRedirect
  (* Client Error *)
  | 400 -> `BadRequest
  | 401 -> `Unauthorized
  | 402 -> `PaymentRequired
  | 403 -> `Forbidden
  | 404 -> `NotFound
  | 405 -> `MethodNotAllowed
  | 406 -> `NotAcceptable
  | 407 -> `ProxyAuthenticationRequired
  | 408 -> `RequestTimeout
  | 409 -> `Conflict
  | 410 -> `Gone
  | 411 -> `LengthRequired
  | 412 -> `PreconditionFailed
  | 413 -> `PayloadTooLarge
  | 414 -> `UriTooLong
  | 415 -> `UnsupportedMediaType
  | 416 -> `RangeNotSatisfiable
  | 417 -> `ExpectationFailed
  | 418 -> `ImATeapot
  | 421 -> `MisdirectedRequest
  | 422 -> `UnprocessableEntity
  | 423 -> `Locked
  | 424 -> `FailedDependency
  | 426 -> `UpgradeRequired
  | 428 -> `PreconditionRequired
  | 429 -> `TooManyRequests
  | 431 -> `RequestHeaderFieldsTooLarge
  | 451 -> `UnavailableForLegalReasons
  (* Server Error *)
  | 500 -> `InternalServerError
  | 501 -> `NotImplemented
  | 502 -> `BadGateway
  | 503 -> `ServiceUnavailable
  | 504 -> `GatewayTimeout
  | 505 -> `HttpVersionNotSupported
  | 506 -> `VariantAlsoNegotiates
  | 507 -> `InsufficientStorage
  | 508 -> `LoopDetected
  | 510 -> `NotExtended
  | 511 -> `NetworkAuthenticationRequired
  | c -> `Other c

let is_successful c = match c with #success -> true | _ -> false
let is_redirect c = match c with #redirection -> true | _ -> false
let is_client_error c = match c with #client_error -> true | _ -> false
let is_server_error c = match c with #server_error -> true | _ -> false
let is_informational c = match c with #informational -> true | _ -> false

let is_error c =
  match c with #server_error | #client_error -> true | _ -> false

let make = of_code