# get a list of servers/computers to ping
# save the status to a txt file for easy review


$servers = Get-Content C:\path\to\serverlist.txt
ForEach ($server in $servers) {
 Try {
  $IP = ((Test-Connection -ea stop -Count 1 -comp $server).IPV4Address).IPAddresstoString
  "$server - UP - $($IP)" >> C:\path\to\serverliststatus.txt
  } 
 Catch {
  Write-Warning "$_"
  "$server - Down - $($_)" >> C:\path\to\serverliststatus.txt
  }
 }
