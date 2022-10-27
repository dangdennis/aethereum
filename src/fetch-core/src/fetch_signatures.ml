module type FETCH = sig
  module Body : sig
    type t

    val to_string : t -> string
    val of_string : string -> t
  end

  module Response : sig
    module Body = Body
    module Status = Status

    type t = {
      body : Body.t;
      headers : Headers.t list;
      status : Status.t;
      url : string;
    }
  end

  module Config : sig
    type t
  end

  val fetch :
    ?body:string ->
    ?headers:Headers.t list ->
    ?meth:Method.t ->
    Config.t ->
    string ->
    string
end
