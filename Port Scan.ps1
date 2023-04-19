# This PowerShell script is designed to scan for open ports on a local machine.

# The script begins by creating an array of commonly used port numbers in computer networks. These port numbers are used by various network protocols and services, and are often targeted by attackers who are looking for vulnerable systems to exploit.

# The script then uses a foreach loop to iterate through each port in the array. For each port, it uses the Test-NetConnection cmdlet to test whether the port is open on the local machine.

# If the port is open, the script outputs a message indicating that the port is open. If the port is closed, the script outputs a message indicating that the port is closed.

# By running this script, you can quickly identify which ports are open on your machine, and take steps to secure any open ports that are not necessary for your system to function.

$ports = 80, 443, 3389, 22, 21, 25, 53, 110, 143, 161, 389, 445, 1433, 3306, 3389, 5432, 5900, 5901, 5902, 8080

foreach ($port in $ports) {
  $result = Test-NetConnection -ComputerName localhost -Port $port -InformationLevel Quiet
  if ($result.TcpTestSucceeded) {
    Write-Host "Port $port is open."
  } else {
    Write-Host "Port $port is closed."
  }
}
