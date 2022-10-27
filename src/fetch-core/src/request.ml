type t = {
  body : string option;
  meth : Method.t;
  headers : Headers.t option;
  url : string;
}

let create ~body ~headers ?(meth = `GET) url = { body; headers; meth; url }
