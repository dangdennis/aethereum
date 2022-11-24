module RpcMethod = struct
  type t =
    | Web3_ClientVersion
    | Web3_Sha3
    | Net_Version
    | Net_Listening
    | Net_PeerCount
    | Eth_ProtocolVersion
    | Eth_Syncing
    | Eth_Coinbase
    | Eth_Mining
    | Eth_Hashrate
    | Eth_GasPrice
    | Eth_Accounts
    | Eth_BlockNumber
    | Eth_GetBalance
    | Eth_GetStorageAt
    | Eth_GetTransactionCount
    | Eth_GetBlockTransactionCountByHash
    | Eth_GetBlockTransactionCountByNumber
    | Eth_GetCode
    | Eth_Sign
    | Eth_SendTransaction
    | Eth_SendRawTransaction
    | Eth_Call
    | Eth_EstimateGas
    | Eth_GetBlockByHash
    | Eth_GetBlockByNumber
    | Eth_GetTransactionByHash
    | Eth_GetTransactionByBlockHashAndIndex
    | Eth_GetTransactionByBlockNumberAndIndex
    | Eth_GetTransactionReceipt
    | Eth_GetUncleByBlockHashAndIndex
    | Eth_GetUncleByBlockNumberAndIndex
    | Eth_GetCompilers
    | Eth_CompileLLL
    | Eth_CompileSolidity
    | Eth_CompileSerpent
    | Eth_NewFilter
    | Eth_NewBlockFilter
    | Eth_NewPendingTransactionFilter
    | Eth_UninstallFilter
    | Eth_GetFilterChanges
    | Eth_GetLogs
    | Eth_GetWork
    | Eth_SubmitWork
    | Eth_SubmitHashrate

  let to_string meth =
    match meth with
    | Web3_ClientVersion -> "web3_clientVersion"
    | Web3_Sha3 -> "web3_sha3"
    | Net_Version -> "net_version"
    | Net_Listening -> "net_listening"
    | Net_PeerCount -> "net_peerCount"
    | Eth_ProtocolVersion -> "eth_protocolVersion"
    | Eth_Syncing -> "eth_syncing"
    | Eth_Coinbase -> "eth_coinbase"
    | Eth_Mining -> "eth_mining"
    | Eth_Hashrate -> "eth_hashrate"
    | Eth_GasPrice -> "eth_gasPrice"
    | Eth_Accounts -> "eth_accounts"
    | Eth_BlockNumber -> "eth_blockNumber"
    | Eth_GetBalance -> "eth_getBalance"
    | Eth_GetStorageAt -> "eth_getStorageAt"
    | Eth_GetTransactionCount -> "eth_getTransactionCount"
    | Eth_GetBlockTransactionCountByHash -> "eth_getBlockTransactionCountByHash"
    | Eth_GetBlockTransactionCountByNumber ->
        "eth_getBlockTransactionCountByNumber"
    | Eth_GetCode -> "eth_getCode"
    | Eth_Sign -> "eth_sign"
    | Eth_SendTransaction -> "eth_sendTransaction"
    | Eth_SendRawTransaction -> "eth_sendRawTransaction"
    | Eth_Call -> "eth_call"
    | Eth_EstimateGas -> "eth_estimateGas"
    | Eth_GetBlockByHash -> "eth_getBlockByHash"
    | Eth_GetBlockByNumber -> "eth_getBlockByNumber"
    | Eth_GetTransactionByHash -> "eth_getTransactionByHash"
    | Eth_GetTransactionByBlockHashAndIndex ->
        "eth_getTransactionByBlockHashAndIndex"
    | Eth_GetTransactionByBlockNumberAndIndex ->
        "eth_getTransactionByBlockNumberAndIndex"
    | Eth_GetTransactionReceipt -> "eth_getTransactionReceipt"
    | Eth_GetUncleByBlockHashAndIndex -> "eth_getUncleByBlockHashAndIndex"
    | Eth_GetUncleByBlockNumberAndIndex -> "eth_getUncleByBlockNumberAndIndex"
    | Eth_GetCompilers -> "eth_getCompilers"
    | Eth_CompileLLL -> "eth_compileLLL"
    | Eth_CompileSolidity -> "eth_compileSolidity"
    | Eth_CompileSerpent -> "eth_compileSerpent"
    | Eth_NewFilter -> "eth_newFilter"
    | Eth_NewBlockFilter -> "eth_newBlockFilter"
    | Eth_NewPendingTransactionFilter -> "eth_newPendingTransactionFilter"
    | Eth_UninstallFilter -> "eth_uninstallFilter"
    | Eth_GetFilterChanges -> "eth_getFilterChanges"
    | Eth_GetLogs -> "eth_getLogs"
    | Eth_GetWork -> "eth_getWork"
    | Eth_SubmitWork -> "eth_submitWork"
    | Eth_SubmitHashrate -> "web3_submitHashrate"
end

type t = {
  jsonrpc : string;
  _method : string; [@key "method"]
  params : string list;
  id : int;
}
[@@deriving jsonaf]

let make ~params ~(meth : RpcMethod.t) =
  { jsonrpc = "2.0"; _method = RpcMethod.to_string meth; params; id = 67 }
