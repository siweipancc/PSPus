BeforeAll {
    Import-Module '../PSPus' -Force
}

Describe 'Test-Empty'{
    It 'normal'  {
        Test-Empty | Should -Be $true
        Test-Empty $null | Should -Be $true
        Test-Empty '' | Should -Be $true
        Test-Empty ' ' | Should -Be $false
        Test-Empty @() | Should -Be $true
        Test-Empty @(1) | Should -Be $false
        Test-Empty @{ } | Should -Be $true
        Test-Empty @{ 1 = 2 } | Should -Be $false

    }


    It '使用管道发送 `$null 字符串' {
        '$null' | Test-Empty | Should -Be $false
    }

    It '非管道中, $null 列表整个发送到函数中' {
        Test-Empty @($null, $null) | Should -Be $false
    }
    It '管道中, 列表中的每个值发送到函数中'{
        @($null, $null) | Test-Empty | Should -Be @($true, $true)
        { 1..2 | Test-Empty } | Should -Throw # 这里会抛出一个错误
        1..2 | ForEach-Object { $_.ToString()}| Test-Empty | Should -Be @($false,$false)
    }
}