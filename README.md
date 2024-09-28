# PSPus

PowerShell 工具类

## 测试

使用 [Pester](https://github.com/pester/pester) 作为测试框架

```shell
Invoke-Pester -Output Detailed .\Tests\*.Tests.ps1
```

## Demo
```shell
Import-Module ./PSPus -Force
Test-Empty @()
Test-Empty @{}
PSPus\Test-Empty @()

Import-Module ./PSPus -Force -prefix z
Test-zEmpty @()
```

## 方法

### Test*

1. Test-Null: 测试是否 **$null** 值
2. Test-BlankString: 测试字符串是否全为空字符
3. Test-Empty: 检测是否为空, 对于 `string` 检测字符长度, 对于 `Icollection` 接口,检测大小

