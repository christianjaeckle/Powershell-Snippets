# General
# 10.0.0.0 to 10.255.255.255
# 172.16.0.0 to 172.31.255.255
# 192.168.0.0 to 192.168.255.255

function Test-PrivateIP {
    <#
        .SYNOPSIS
            Use to determine if a given IP address is within the IPv4 private address space ranges.

        .DESCRIPTION
            Returns $true or $false for a given IP address string depending on whether or not is is within the private IP address ranges.

        .PARAMETER IP
            The IP address to test.

        .EXAMPLE
            Test-PrivateIP -IP 172.16.1.2

        .EXAMPLE
            '10.1.2.3' | Test-PrivateIP
    #>
    param(
        [parameter(Mandatory,ValueFromPipeline)]
        [string]
        $IP
    )
    process {

        if ($IP -Match '(^127\.)|(^192\.168\.)|(^10\.)|(^172\.1[6-9]\.)|(^172\.2[0-9]\.)|(^172\.3[0-1]\.)') {
            $true
        }
        else {
            $false
        }
    }    
}

# OR most advanced version
$Pattern = '^(?:(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)\.){3}(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)$'
'192.168.0.0' -match $Pattern

# OR
$Pattern = "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
'192.168.0.0' -match $pattern

# OR
[IPAddress] '192.168.0.1'
