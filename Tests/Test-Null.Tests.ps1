BeforeAll {
    Import-Module '../PSPus'
}

Describe 'Test-Null'{
    It 'normal' {
        Test-Null  | Should -Be $true
        Test-Null -o '' | Should -Be $false
        Test-Null -o ' ' | Should -Be $false
        Test-Null -o '$null' | Should -Be $false
        Test-Null -o $null | Should -Be $true
        Test-Null -o '  ' | Should -Be $false


    }
    It 'pipes' {
        '$null' | Test-Null | Should -Be $false
        @(1, 2, $null, "") | Test-Null | Should -Be @($false, $false, $true, $false)
    }
}