module Create_fetch_implementation (F : Fetch_signatures.FETCH) = struct
  module Headers = Headers
  module Status = Status
  module Method = Method
  module Request = Request
  module Body = F.Body
  module Response = F.Response
  module Config = F.Config

  let fetch = F.fetch
  let get = fetch ~meth:`GET
  let post = fetch ~meth:`POST
  let put = fetch ~meth:`PUT
  let delete = fetch ~meth:`DELETE
end
