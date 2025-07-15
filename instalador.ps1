# instalador.ps1
$usuario = Read-Host "👤 Usuario"
$clave = Read-Host "🔐 Clave"

# Lista de usuarios válidos
$credenciales = @{
    "damian" = "123456"
    "americo" = "superclave123"
}

if (-not $credenciales.ContainsKey($usuario)) {
    Write-Host "❌ Usuario no válido"
    exit
}

if ($credenciales[$usuario] -ne $clave) {
    Write-Host "❌ Clave incorrecta"
    exit
}

Write-Host "✅ Autenticación exitosa. Ejecutando instalador..."

# Ruta temporal para el BAT
$batURL = "https://raw.githubusercontent.com/superman66VI/win10-postinstall-runti-/main/instalador_online.bat"
$batTemp = "$env:TEMP\instalador_online.bat"

# Descargar el .BAT principal (el que ya tienes funcionando con ZIP y RunAsTI)
Invoke-WebRequest -Uri $batURL -OutFile $batTemp

# Ejecutarlo como administrador
Start-Process -FilePath $batTemp -Verb runAs
