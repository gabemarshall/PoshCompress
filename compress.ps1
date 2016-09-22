# Get script contents and compress it
$contents = Get-Content .\script_to_compress.ps1
$ms = New-Object IO.MemoryStream
$action = [IO.Compression.CompressionMode]::Compress
$cs = New-Object IO.Compression.DeflateStream ($ms,$action)
$sw = New-Object IO.StreamWriter ($cs, [Text.Encoding]::ASCII)
$contents | ForEach-Object {$sw.WriteLine($_)}
$sw.Close()
$code = [Convert]::ToBase64String($ms.ToArray());

# Construct an execution one liner

$command = "IEX `$(New-Object IO.StreamReader (" + "`$(New-Object IO.Compression.DeflateStream (" + "`$(New-Object IO.MemoryStream (,"+ "`$([Convert]::FromBase64String(`"$code`")))), " + "[IO.Compression.CompressionMode]::Decompress)),"+
    " [Text.Encoding]::ASCII)).ReadToEnd();"
Write-Host $command