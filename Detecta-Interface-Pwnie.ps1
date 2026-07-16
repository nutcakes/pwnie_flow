while ($true) {

    # Obtém os endereços IPv4 do computador
    $ip = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue |

        # Filtra apenas os IPs da rede do Pwnie
        Where-Object { $_.IPAddress -like "10.12.194.*" } |

        # Seleciona apenas o primeiro IP encontrado
        Select-Object -ExpandProperty IPAddress -First 1

    # Caso um IP tenha sido encontrado
    if ($ip) {

        # Exibe o endereço IP encontrado
        Write-Host "IP encontrado: $ip"

        # Encerra o loop
        break
    }

    # Caso a interface ainda não tenha sido criada
    Write-Host "Aguardando interface..."

    # Aguarda 2 segundos antes de tentar novamente
    Start-Sleep -Seconds 2
}
