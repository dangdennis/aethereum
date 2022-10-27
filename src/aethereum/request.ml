type t = {
  jsonrpc : string;
  _method : string; [@key "method"]
  params : string list;
  id : int;
}
[@@deriving jsonaf]