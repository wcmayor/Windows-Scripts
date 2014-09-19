$lines = get-content ips.txt
foreach ($ip in $lines)
{
	try
	{
		$hostname = (resolve-dnsname $ip -EA SilentlyContinue)[0].NameHost
	}
	catch
	{
		echo "Unable to determine hostname for $ip"
		continue
	}
	echo "$ip - $hostname"
}
