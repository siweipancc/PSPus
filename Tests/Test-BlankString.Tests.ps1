BeforeAll {
    Import-Module '../PSPus'
}

Describe 'Test-BlankString'{
    It 'normal' {
        Test-BlankString  | Should -Be $true
        Test-BlankString -o '' | Should -Be $true
        Test-BlankString -o ' ' | Should -Be $true
        Test-BlankString -o 'null' | Should -Be $false
        Test-BlankString -o $null | Should -Be $true
        Test-BlankString -o '  ' | Should -Be $true


    }
    It 'pipes' {
        '$null' | Test-BlankString | Should -Be $false
        @(1, 2, $null, "") | Test-BlankString | Should -Be @($false, $false, $true, $true)
    }
}
