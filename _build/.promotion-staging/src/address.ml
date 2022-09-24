type t

let of_string addr = addr

let test_pub_key = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlRZT2dnXy01RU9FYmxhWS1WVlJZcVZhREFncHRuZktWNDUzNU1aUEMwdzAifQ.eyJpYXQiOjE2NjM5NzgzNDUsImF1ZCI6IkJFS1ZuZEFKMXN5Q24xUWVTWEFIT0M5RkVnQ3l2YVZSdnpMR1Y1WDdDR2JHazNfOTdDSVpmYzIydEJNV2JjZm9FTnNHb0dTSXFRNWJiZDYyYXowZ2dZQSIsIm5vbmNlIjoiMDI2YzY2ZmQwYjEyNGMwZGNiYzEyZTE0ZGQ0NmRhMTVlYjQwYTQxNmZjYjE3MTU0MjAzN2UzOTMwYWFkM2YyMzBlIiwiaXNzIjoiaHR0cHM6Ly9hcGkub3BlbmxvZ2luLmNvbSIsIndhbGxldHMiOlt7InB1YmxpY19rZXkiOiIwMmY3NzM3ZTQ1YjQzZGNlODhiMDNhMGVmYmEzNzdiNzMzZGMyMWE2NTU1OWZkYTlmMDE1YzM1MzIzMzc4Nzc2MTkiLCJ0eXBlIjoid2ViM2F1dGhfYXBwX2tleSIsImN1cnZlIjoic2VjcDI1NmsxIn1dLCJlbWFpbCI6ImRlbm5pc0B5b21pZ2FtZXMuZ2ciLCJuYW1lIjoiRGVubmlzIERhbmciLCJwcm9maWxlSW1hZ2UiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BTG01d3UyQ3p6dXpOZ0EtMUlCc0VWOUcwcThEamtEMU1INk9uaDJuOG1CTz1zOTYtYyIsInZlcmlmaWVyIjoidG9ydXMiLCJ2ZXJpZmllcklkIjoiZGVubmlzQHlvbWlnYW1lcy5nZyIsImFnZ3JlZ2F0ZVZlcmlmaWVyIjoidGtleS1nb29nbGUtbHJjIiwiZXhwIjoxNjY0MDY0NzQ1fQ.2sqbUQDr-6zS-Sxxg8oU1iAgQXQch7tSj1Z5xNrzUTlGfsgaIr0J5qFhLkub8G404Q4yQ09eHklTBOeEUVnCdA"

let digest_keccak256 () = 
  let digest = EzHash.SHA3KEC.digest test_pub_key in
  digest

let%expect_test "keccak256" =
  let digest = digest_keccak256 () in
  print_endline digest;
  [%expect {| k*���N=�\|˧�B̢���}4����-��� |}]
;;

let%expect_test "addition" =
  Format.printf "%d" (1 + 2);
  [%expect {| 3 |}]
;;