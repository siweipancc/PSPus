using namespace System.Collections
using namespace System.Collections.Generic

<#
.DESCRIPTION
测试对象是否为空
.PARAMETER o
判定的对象

.EXAMPLE
Test-Null
Test-Null ''
$null | Test-Null
@() | Test-Null
$notExist | Test-Null
#>
function Test-Null()
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param([Parameter(Mandatory = $false, Position = 0, ValueFromPipeline)][Object]$o)
    begin{
    }
    process{
        return $null -eq $o
    }
    end{
    }
}

<#
.DESCRIPTION
测试字符串是否为空
.PARAMETER o
判定的字符

.EXAMPLE
Test-BlankString
Test-BlankString ''
Test-BlankString $null
Test-BlankString ' '
Test-BlankString -o 'not'
#>
function Test-BlankString()
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param([Parameter(Mandatory = $false, Position = 0, ValueFromPipeline)][string]$o)
    begin{
    }
    process{
        if (Test-Null $o)
        {
            return $true
        }

        if (($o -replace " ", "") -eq '')
        {
            return $true
        }
        return $false

    }
    end{
    }
}


<#
.DESCRIPTION
测试对象是否为空
.PARAMETER o
判定的对象

.EXAMPLE
Test-Empty
Test-Empty ''
Test-Empty $null
Test-Empty @(1,2)
Test-Empty @{1=2}
Test-Empty 1..2
1..2 | ForEach-Object { $_.ToString()}| Test-Empty # 管道中每个数值都被依次发送, 需要注意转换

#>
function Test-Empty()
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param([Parameter(Mandatory = $false, Position = 0, ValueFromPipeline)]$o)
    begin{
    }
    process{
        if (Test-Null $o)
        {
            Write-Debug "NULL"
            return $true
        }
        Write-Debug "type: $($o.GetType() )"
        Write-Debug "ImplementedInterfaces: $( $o.GetType().ImplementedInterfaces )"
        if ( $o.GetType().ImplementedInterfaces.Contains([Icollection]))
        {
            return ([Icollection]$o).Count -eq 0
        }
        if ($o.GetType() -eq [String])
        {
            return  '' -eq $o
        }
        throw "unsupported class! $($o.GetType()) "

    }
    end{
    }
}
