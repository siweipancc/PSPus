@{
    NestedModules = @('PSPus.psm1')
    ModuleVersion = '1.0.0'
    GUID = 'a3b4ceb5-6eb0-40ac-a123-ed26d2e08e05'
    Author = 'siweipancc'
    CompanyName = 'siweipancc'
    Copyright = '(c) siweipancc. All rights reserved.'
    PowerShellVersion = '7.4'
    RequiredAssemblies = @(
        'System.Runtime.dll'
    )
    FunctionsToExport = @(
        'Test-BlankString',
        'Test-Null',
        'Test-Empty'
    )
}