  <#  

.NOTES
	NAME:	Calcul_réseaux.ps1
    VERSION : 1.0  17/04/2022
	AUTHOR:	Frédéric Puren


1 - prend l'adresse IP du PC sur lequel il est lancé et calcul l'adresse IP du réseau, la première et la dernière adresse IP machine et l'adresse de broadcast.
2 - idem mais on rentre l'adresse IP et le masque sous-réseau que l'on souhaite
3 - Convertisseur d'adresse IP Décimal en Binaire
4 - Convertisseur d'adresse IP Binaire en Décimal
  
  
  
  sources : 

  faire un menu : https://wiki-tech.io/Scripting/Powershell/Menu

  pour convertir decimal vers binaire et vice versa : https://devblogs.microsoft.com/scripting/use-powershell-to-easily-convert-decimal-to-binary-and-back/

  séparer des chaines de caractère : https://www.it-connect.fr/powershell-et-split-decouper-une-chaine-de-caracteres/

  extraire une chaine de caractère : https://www.it-connect.fr/powershell-et-substring-extraire-une-chaine-dune-chaine/

  padleft, padright : https://4sysops.com/archives/how-to-add-leading-and-ending-zeroes-to-strings-in-powershell/
 #>
    
    
    
    
    
    
     Do {
  
  
  write-host “################## MENU ###################” -ForegroundColor Blue
  Write-Host ""
  write-host “1. Calcul réseau pour la configuration IP actuelle du PC” -ForegroundColor Cyan
  write-host "2. Calcul réseau pour n'importe quelles IP" -ForegroundColor DarkCyan
  write-host "3. Conversion Adresse IP Decimal Vers Binaire” -ForegroundColor Cyan
  write-host "4. Conversion Adresse IP Binaire Vers Decimal" -ForegroundColor DarkCyan
  write-host "x.  Exit" -ForegroundColor Red
  Write-Host ""
  write-host "###########################################" -ForegroundColor Blue
  Write-Host ""


  $choix = read-host “faire un choix”

  Write-Host ""


  switch ($choix){

  ######################################################################################
  # 1.  Calcul réseau pour la configuration IP actuelle du PC”

    1{
   
   
   
   
   
   
    #interfaces actives
    $InterfaceUp = Get-NetAdapter | where {$_.status -like "Up" -and $_.Name -notlike "VMware*" -and $_.Name -notlike "Connexion*"} | select -ExpandProperty Name
    $MasqueCIDR = get-netipaddress | where {$_.interfaceAlias -eq $InterfaceUp -and $_.AddressFamily -eq "IPv4"} | select -ExpandProperty PrefixLength
    $Mac = Get-netadapter -Name $InterfaceUp | select -ExpandProperty MacAddress
    $DHCP = Get-NetIPInterface | where {$_.InterfaceAlias -eq $InterfaceUp -and $_.AddressFamily -eq "IPv4"} | select -ExpandProperty Dhcp
    $AdresseIP = Get-NetIPAddress | where {$_.interfaceAlias -eq $InterfaceUp -and $_.AddressFamily -eq "IPv4"} | select -ExpandProperty IPAddress

    if ($MasqueCIDR -eq 0)
    {
    $Masque = "0.0.0.0"
    }

    if ($MasqueCIDR -eq 1)
    {
    $Masque = "128.0.0.0"
    $HotesTotal = "2 147 483 646"
    }
    
    if ($MasqueCIDR -eq 2)
    {
    $Masque = "192.0.0.0"
    $HotesTotal = "1 073 741 822"
    }
    
    if ($MasqueCIDR -eq 3)
    {
    $Masque = "224.0.0.0"
    $HotesTotal = "536 870 910"
    }
    
    if ($MasqueCIDR -eq 4)
    {
    $Masque = "140.0.0.0"
    $HotesTotal = "268 435 454"
    }
    
    if ($MasqueCIDR -eq 5)
    {
    $Masque = "148.0.0.0"
    $HotesTotal = "134 217 726"
    }
    
    if ($MasqueCIDR -eq 6)
    {
    $Masque = "252.0.0.0"
    $HotesTotal = "67 108 862"
    }
    
    if ($MasqueCIDR -eq 7)
    {
    $Masque = "254.0.0.0"
    $HotesTotal = "33 554 430"
    }
 
    if ($MasqueCIDR -eq 8)
    {
    $Masque = "255.0.0.0"
    $HotesTotal = "16 777 214"
    }

    if ($MasqueCIDR -eq 9)
    {
    $Masque = "255.128.0.0"
    $HotesTotal = "8 388 606"
    }

    if ($MasqueCIDR -eq 10)
    {
    $Masque = "255.192.0.0"
    $HotesTotal = "4 194 302"
    }

    if ($MasqueCIDR -eq 11)
    {
    $Masque = "255.224.0.0"
    $HotesTotal = "2 097 150"
    }

    if ($MasqueCIDR -eq 12)
    {
    $Masque = "255.240.0.0"
    $HotesTotal = "1 048 574"
    }

    if ($MasqueCIDR -eq 13)
    {
    $Masque = "255.248.0.0"
    $HotesTotal = "524 286"
    }

    if ($MasqueCIDR -eq 14)
    {
    $Masque = "255.252.0.0"
    $HotesTotal = "262 142"
    }

    if ($MasqueCIDR -eq 15)
    {
    $Masque = "255.254.0.0"
    $HotesTotal = "131 070"
    }

    if ($MasqueCIDR -eq 16)
    {
    $Masque = "255.255.0.0"
    $HotesTotal = "65 534"
    }

    if ($MasqueCIDR -eq 17)
    {
    $Masque = "255.255.128.0"
    $HotesTotal = "32 766"
    }

    if ($MasqueCIDR -eq 18)
    {
    $Masque = "255.255.192.0"
    $HotesTotal = "16 382"
    }

    if ($MasqueCIDR -eq 19)
    {
    $Masque = "255.255.224.0"
    $HotesTotal = "8 190"
    }

    if ($MasqueCIDR -eq 20)
    {
    $Masque = "255.255.240.0"
    $HotesTotal = "4 094"
    }

    if ($MasqueCIDR -eq 21)
    {
    $Masque = "255.255.248.0"
    $HotesTotal = "2 046"
    }

    if ($MasqueCIDR -eq 22)
    {
    $Masque = "255.255.252.0"
    $HotesTotal = "1 022"
    }

    if ($MasqueCIDR -eq 23)
    {
    $Masque = "255.255.254.0"
    $HotesTotal = "510"
    }

    if ($MasqueCIDR -eq 24)
    {
    $Masque = "255.255.255.0"
    $HotesTotal = "254"
    }

    if ($MasqueCIDR -eq 25)
    {
    $Masque = "255.255.255.128"
    $HotesTotal = "126"
    }

    if ($MasqueCIDR -eq 26)
    {
    $Masque = "255.255.255.192"
    $HotesTotal = "62"
    }


    if ($MasqueCIDR -eq 27)
    {
    $Masque = "255.255.255.224"
    $HotesTotal = "30"
    }

    if ($MasqueCIDR -eq 28)
    {
    $Masque = "255.255.255.240"
    $HotesTotal = "14"
    }

    if ($MasqueCIDR -eq 29)
    {
    $Masque = "255.255.255.248"
    $HotesTotal = "6"
    }

    if ($MasqueCIDR -eq 30)
    {
    $Masque = "255.255.255.252"
    $HotesTotal = "2"
    }

    if ($MasqueCIDR -eq 31)
    {
    $Masque = "255.255.255.254"
    $HotesTotal = "2"
    }

    if ($MasqueCIDR -eq 32)
    {
    $Masque = "255.255.255.255"
    $HotesTotal = "1"
    }


    Get-NetIPConfiguration

    Clear-Host

    write-Host "Configuration IP host actuelle :" -ForegroundColor Green

    write-host ""


    Get-NetIPConfiguration | where InterfaceAlias -eq $InterfaceUp


    write-host "Masque sous-réseaux  : $Masque / CIDR: $MasqueCIDR"

    
    Write-Host "Adresse MAC          : $Mac"

    
    Write-Host "DHCP                 : $DHCP"

    Write-Host ""
    Write-Host ""


    Write-Host "------------------------------------------------------------------------"


#----------------------------------------------------------------------------
# conversion de l'adress IP actuelle du PC en BInaire

# séparation des 4 éléments séparés par les points
$AdresseIPSplit = $AdresseIP.Split(".")

$a = $AdresseIPSplit[0]
$b = $AdresseIPSplit[1]
$c = $AdresseIPSplit[2]
$d = $AdresseIPSplit[3]

# conversion en base 2
$a_binaire = [convert]::ToString($a,2)
$b_binaire = [convert]::ToString($b,2)
$c_binaire = [convert]::ToString($c,2)
$d_binaire = [convert]::ToString($d,2)

#ajout de 0 à gauche avec un maximum de 8 chiffres au total
$a_binaireOctet = $a_binaire.PadLeft(8,'0')
$b_binaireOctet = $b_binaire.PadLeft(8,'0')
$c_binaireOctet = $c_binaire.PadLeft(8,'0')
$d_binaireOctet = $d_binaire.PadLeft(8,'0')

$Conversion_AdresseIP = "$a_binaireOctet.$b_binaireOctet.$c_binaireOctet.$d_binaireOctet"

#---------------------------------------------------------------------------------------

# conversion du masque de sous-réseau en Binaire

$MasqueSplit = $Masque.Split(".")

$e = $MasqueSplit[0]
$f = $MasqueSplit[1]
$g = $MasqueSplit[2]
$h = $MasqueSplit[3]

# conversion en base 2
$e_binaire = [convert]::ToString($e,2)
$f_binaire = [convert]::ToString($f,2)
$g_binaire = [convert]::ToString($g,2)
$h_binaire = [convert]::ToString($h,2)

#ajout de 0 à gauche avec un maximum de 8 chiffres au total
$e_binaireOctet = $e_binaire.PadLeft(8,'0')
$f_binaireOctet = $f_binaire.PadLeft(8,'0')
$g_binaireOctet = $g_binaire.PadLeft(8,'0')
$h_binaireOctet = $h_binaire.PadLeft(8,'0')

$Conversion_Masque = "$e_binaireOctet.$f_binaireOctet.$g_binaireOctet.$h_binaireOctet"

#---------------------------------------------------------------------------------------

# calcul de l'adresse réseau


#séparation de chaque caractère des adresses IP et Masque pour correspondance de chaque Bit ( 1+1=1, 1+0=0 , 0+0=0 )

# partie Adresse IP
$chiffre1 = $Conversion_AdresseIP[0]
$chiffre2 = $Conversion_AdresseIP[1]
$chiffre3 = $Conversion_AdresseIP[2]
$chiffre4 = $Conversion_AdresseIP[3]
$chiffre5 = $Conversion_AdresseIP[4]
$chiffre6 = $Conversion_AdresseIP[5]
$chiffre7 = $Conversion_AdresseIP[6]
$chiffre8 = $Conversion_AdresseIP[7]
$chiffre9 = $Conversion_AdresseIP[9]
$chiffre10 = $Conversion_AdresseIP[10]
$chiffre11 = $Conversion_AdresseIP[11]
$chiffre12 = $Conversion_AdresseIP[12]
$chiffre13 = $Conversion_AdresseIP[13]
$chiffre14 = $Conversion_AdresseIP[14]
$chiffre15 = $Conversion_AdresseIP[15]
$chiffre16 = $Conversion_AdresseIP[16]
$chiffre17 = $Conversion_AdresseIP[18]
$chiffre18 = $Conversion_AdresseIP[19]
$chiffre19 = $Conversion_AdresseIP[20]
$chiffre20 = $Conversion_AdresseIP[21]
$chiffre21 = $Conversion_AdresseIP[22]
$chiffre22 = $Conversion_AdresseIP[23]
$chiffre23 = $Conversion_AdresseIP[24]
$chiffre24 = $Conversion_AdresseIP[25]
$chiffre25 = $Conversion_AdresseIP[27]
$chiffre26 = $Conversion_AdresseIP[28]
$chiffre27 = $Conversion_AdresseIP[29]
$chiffre28 = $Conversion_AdresseIP[30]
$chiffre29 = $Conversion_AdresseIP[31]
$chiffre30 = $Conversion_AdresseIP[32]
$chiffre31 = $Conversion_AdresseIP[33]
$chiffre32 = $Conversion_AdresseIP[34]

# partie Masque
$chiffre1a = $Conversion_Masque[0]
$chiffre2a = $Conversion_Masque[1]
$chiffre3a = $Conversion_Masque[2]
$chiffre4a = $Conversion_Masque[3]
$chiffre5a = $Conversion_Masque[4]
$chiffre6a = $Conversion_Masque[5]
$chiffre7a = $Conversion_Masque[6]
$chiffre8a = $Conversion_Masque[7]
$chiffre9a = $Conversion_Masque[9]
$chiffre10a = $Conversion_Masque[10]
$chiffre11a = $Conversion_Masque[11]
$chiffre12a = $Conversion_Masque[12]
$chiffre13a = $Conversion_Masque[13]
$chiffre14a = $Conversion_Masque[14]
$chiffre15a = $Conversion_Masque[15]
$chiffre16a = $Conversion_Masque[16]
$chiffre17a = $Conversion_Masque[18]
$chiffre18a = $Conversion_Masque[19]
$chiffre19a = $Conversion_Masque[20]
$chiffre20a = $Conversion_Masque[21]
$chiffre21a = $Conversion_Masque[22]
$chiffre22a = $Conversion_Masque[23]
$chiffre23a = $Conversion_Masque[24]
$chiffre24a = $Conversion_Masque[25]
$chiffre25a = $Conversion_Masque[27]
$chiffre26a = $Conversion_Masque[28]
$chiffre27a = $Conversion_Masque[29]
$chiffre28a = $Conversion_Masque[30]
$chiffre29a = $Conversion_Masque[31]
$chiffre30a = $Conversion_Masque[32]
$chiffre31a = $Conversion_Masque[33]
$chiffre32a = $Conversion_Masque[34]


[int] $resultat1 = $chiffre1 + $chiffre1a
[int] $resultat2 = $chiffre2 + $chiffre2a
[int] $resultat3 = $chiffre3 + $chiffre3a
[int] $resultat4 = $chiffre4 + $chiffre4a
[int] $resultat5 = $chiffre5 + $chiffre5a
[int] $resultat6 = $chiffre6 + $chiffre6a
[int] $resultat7 = $chiffre7 + $chiffre7a
[int] $resultat8 = $chiffre8 + $chiffre8a
[int] $resultat9 = $chiffre9 + $chiffre9a
[int] $resultat10 = $chiffre10 + $chiffre10a
[int] $resultat11 = $chiffre11 + $chiffre11a
[int] $resultat12 = $chiffre12 + $chiffre12a
[int] $resultat13 = $chiffre13 + $chiffre13a
[int] $resultat14 = $chiffre14 + $chiffre14a
[int] $resultat15 = $chiffre15 + $chiffre15a
[int] $resultat16 = $chiffre16 + $chiffre16a
[int] $resultat17 = $chiffre17 + $chiffre17a
[int] $resultat18 = $chiffre18 + $chiffre18a
[int] $resultat19 = $chiffre19 + $chiffre19a
[int] $resultat20 = $chiffre20 + $chiffre20a
[int] $resultat21 = $chiffre21 + $chiffre21a
[int] $resultat22 = $chiffre22 + $chiffre22a
[int] $resultat23 = $chiffre23 + $chiffre23a
[int] $resultat24 = $chiffre24 + $chiffre24a
[int] $resultat25 = $chiffre25 + $chiffre25a
[int] $resultat26 = $chiffre26 + $chiffre26a
[int] $resultat27 = $chiffre27 + $chiffre27a
[int] $resultat28 = $chiffre28 + $chiffre28a
[int] $resultat29 = $chiffre29 + $chiffre29a
[int] $resultat30 = $chiffre30 + $chiffre30a
[int] $resultat31 = $chiffre31 + $chiffre31a
[int] $resultat32 = $chiffre32 + $chiffre32a
[int] $resultat33 = $chiffre33 + $chiffre33a
[int] $resultat34 = $chiffre34 + $chiffre34a

# les résultats ci-dessus donne soit 00(0) soit 01(1) soit 10 soit 11, pour avoir l'adresse du réseau : 0 et 0 donne 0, 1 et 0 donne 0 et 1 et 1 donne 1.
if ($resultat1 -eq 0 -or $resultat1 -eq 1 -or $resultat1 -eq 10)

{
$resultatBinaire1 = 0
}

if ($resultat1 -eq 11)

{
$resultatBinaire1 = 1
}

if ($resultat2 -eq 0 -or $resultat2 -eq 1 -or $resultat2 -eq 10)

{
$resultatBinaire2 = 0
}

if ($resultat2 -eq 11)

{
$resultatBinaire2 = 1
}

if ($resultat3 -eq 0 -or $resultat3 -eq 1 -or $resultat3 -eq 10)

{
$resultatBinaire3 = 0
}

if ($resultat3 -eq 11)

{
$resultatBinaire3 = 1
}

if ($resultat4 -eq 0 -or $resultat4 -eq 1 -or $resultat4 -eq 10)

{
$resultatBinaire4 = 0
}

if ($resultat4 -eq 11)

{
$resultatBinaire4 = 1
}

if ($resultat5 -eq 0 -or $resultat5 -eq 1 -or $resultat5 -eq 10)

{
$resultatBinaire5 = 0
}

if ($resultat5 -eq 11)

{
$resultatBinaire5 = 1
}

if ($resultat6 -eq 0 -or $resultat6 -eq 1 -or $resultat6 -eq 10)

{
$resultatBinaire6 = 0
}

if ($resultat6 -eq 11)

{
$resultatBinaire6 = 1
}

if ($resultat7 -eq 0 -or $resultat7 -eq 1 -or $resultat7 -eq 10)

{
$resultatBinaire7 = 0
}

if ($resultat7 -eq 11)

{
$resultatBinaire7 = 1
}

if ($resultat8 -eq 0 -or $resultat8 -eq 1 -or $resultat8 -eq 10)

{
$resultatBinaire8 = 0
}

if ($resultat8 -eq 11)

{
$resultatBinaire8 = 1
}

if ($resultat9 -eq 0 -or $resultat9 -eq 1 -or $resultat9 -eq 10)

{
$resultatBinaire9 = 0
}

if ($resultat9 -eq 11)

{
$resultatBinaire9 = 1
}

if ($resultat10 -eq 0 -or $resultat10 -eq 1 -or $resultat10 -eq 10)

{
$resultatBinaire10 = 0
}

if ($resultat10 -eq 11)

{
$resultatBinaire10 = 1
}

if ($resultat11 -eq 0 -or $resultat11 -eq 1 -or $resultat11 -eq 10)

{
$resultatBinaire11 = 0
}

if ($resultat11 -eq 11)

{
$resultatBinaire11 = 1
}

if ($resultat12 -eq 0 -or $resultat12 -eq 1 -or $resultat12 -eq 10)

{
$resultatBinaire12 = 0
}

if ($resultat12 -eq 11)

{
$resultatBinaire12 = 1
}

if ($resultat13 -eq 0 -or $resultat13 -eq 1 -or $resultat13 -eq 10)

{
$resultatBinaire13 = 0
}

if ($resultat13 -eq 11)

{
$resultatBinaire13 = 1
}

if ($resultat14 -eq 0 -or $resultat14 -eq 1 -or $resultat14 -eq 10)

{
$resultatBinaire14 = 0
}

if ($resultat14 -eq 11)

{
$resultatBinaire14 = 1
}

if ($resultat15 -eq 0 -or $resultat15 -eq 1 -or $resultat15 -eq 10)

{
$resultatBinaire15 = 0
}

if ($resultat15 -eq 11)

{
$resultatBinaire15 = 1
}

if ($resultat16 -eq 0 -or $resultat16 -eq 1 -or $resultat16 -eq 10)

{
$resultatBinaire16 = 0
}

if ($resultat16 -eq 11)

{
$resultatBinaire16 = 1
}

if ($resultat17 -eq 0 -or $resultat17 -eq 1 -or $resultat17 -eq 10)

{
$resultatBinaire17 = 0
}

if ($resultat17 -eq 11)

{
$resultatBinaire17 = 1
}

if ($resultat18 -eq 0 -or $resultat18 -eq 1 -or $resultat18 -eq 10)

{
$resultatBinaire18 = 0
}

if ($resultat18 -eq 11)

{
$resultatBinaire18 = 1
}

if ($resultat19 -eq 0 -or $resultat19 -eq 1 -or $resultat19 -eq 10)

{
$resultatBinaire19 = 0
}

if ($resultat19 -eq 11)

{
$resultatBinaire19 = 1
}

if ($resultat20 -eq 0 -or $resultat20 -eq 1 -or $resultat20 -eq 10)

{
$resultatBinaire20 = 0
}

if ($resultat20 -eq 11)

{
$resultatBinaire20 = 1
}

if ($resultat21 -eq 0 -or $resultat21 -eq 1 -or $resultat21 -eq 10)

{
$resultatBinaire21 = 0
}

if ($resultat21 -eq 11)

{
$resultatBinaire21 = 1
}

if ($resultat22 -eq 0 -or $resultat22 -eq 1 -or $resultat22 -eq 10)

{
$resultatBinaire22 = 0
}

if ($resultat22 -eq 11)

{
$resultatBinaire22 = 1
}

if ($resultat23 -eq 0 -or $resultat23 -eq 1 -or $resultat23 -eq 10)

{
$resultatBinaire23 = 0
}

if ($resultat23 -eq 11)

{
$resultatBinaire23 = 1
}

if ($resultat24 -eq 0 -or $resultat24 -eq 1 -or $resultat24 -eq 10)

{
$resultatBinaire24 = 0
}

if ($resultat24 -eq 11)

{
$resultatBinaire24 = 1
}

if ($resultat25 -eq 0 -or $resultat25 -eq 1 -or $resultat25 -eq 10)

{
$resultatBinaire25 = 0
}

if ($resultat25 -eq 11)

{
$resultatBinaire25 = 1
}

if ($resultat26 -eq 0 -or $resultat26 -eq 1 -or $resultat26 -eq 10)

{
$resultatBinaire26 = 0
}

if ($resultat26 -eq 11)

{
$resultatBinaire26 = 1
}

if ($resultat27 -eq 0 -or $resultat27 -eq 1 -or $resultat27 -eq 10)

{
$resultatBinaire27 = 0
}

if ($resultat27 -eq 11)

{
$resultatBinaire27 = 1
}

if ($resultat28 -eq 0 -or $resultat28 -eq 1 -or $resultat28 -eq 10)

{
$resultatBinaire28 = 0
}

if ($resultat28 -eq 11)

{
$resultatBinaire28 = 1
}

if ($resultat29 -eq 0 -or $resultat29 -eq 1 -or $resultat29 -eq 10)

{
$resultatBinaire29 = 0
}

if ($resultat29 -eq 11)

{
$resultatBinaire29 = 1
}

if ($resultat30 -eq 0 -or $resultat30 -eq 1 -or $resultat30 -eq 10)

{
$resultatBinaire30 = 0
}

if ($resultat30 -eq 11)

{
$resultatBinaire30 = 1
}

if ($resultat31 -eq 0 -or $resultat31 -eq 1 -or $resultat31 -eq 10)

{
$resultatBinaire31 = 0
}

if ($resultat31 -eq 11)

{
$resultatBinaire31 = 1
}

if ($resultat32 -eq 0 -or $resultat32 -eq 1 -or $resultat32 -eq 10)

{
$resultatBinaire32 = 0
}

if ($resultat32 -eq 11)

{
$resultatBinaire32 = 1
}


#--------------------------------------------------------------------------------
# calcul de l'adresse du réseau

$calcul_adresse_reseau_Binaire = "$resultatBinaire1$resultatBinaire2$resultatBinaire3$resultatBinaire4$resultatBinaire5$resultatBinaire6$resultatBinaire7$resultatBinaire8.$resultatBinaire9$resultatBinaire10$resultatBinaire11$resultatBinaire12$resultatBinaire13$resultatBinaire14$resultatBinaire15$resultatBinaire16.$resultatBinaire17$resultatBinaire18$resultatBinaire19$resultatBinaire20$resultatBinaire21$resultatBinaire22$resultatBinaire23$resultatBinaire24.$resultatBinaire25$resultatBinaire26$resultatBinaire27$resultatBinaire28$resultatBinaire29$resultatBinaire30$resultatBinaire31$resultatBinaire32"


$calcul_adresse_reseau_BinaireSplit = $calcul_adresse_reseau_Binaire.Split(".")

$g = $calcul_adresse_reseau_BinaireSplit[0]
$h = $calcul_adresse_reseau_BinaireSplit[1]
$i = $calcul_adresse_reseau_BinaireSplit[2]
$j = $calcul_adresse_reseau_BinaireSplit[3]

# conversion en décimal
$g_Decimal = [convert]::ToInt32($g,2)
$h_Decimal = [convert]::ToInt32($h,2)
$i_Decimal = [convert]::ToInt32($i,2)
$j_Decimal = [convert]::ToInt32($j,2)

$AdresseIPReseau = "$g_Decimal.$h_Decimal.$i_Decimal.$j_Decimal"

# -------------------------------------------------------------------------
#Calcul du premier Host 

$PremierHostBinaire = "$resultatBinaire1$resultatBinaire2$resultatBinaire3$resultatBinaire4$resultatBinaire5$resultatBinaire6$resultatBinaire7$resultatBinaire8.$resultatBinaire9$resultatBinaire10$resultatBinaire11$resultatBinaire12$resultatBinaire13$resultatBinaire14$resultatBinaire15$resultatBinaire16.$resultatBinaire17$resultatBinaire18$resultatBinaire19$resultatBinaire20$resultatBinaire21$resultatBinaire22$resultatBinaire23$resultatBinaire24.$resultatBinaire25$resultatBinaire26$resultatBinaire27$resultatBinaire28$resultatBinaire29$resultatBinaire30$resultatBinaire31" + "1"

$PremierHostBinaireSplit = $PremierHostBinaire.Split(".")

$k = $PremierHostBinaireSplit[0]
$l = $PremierHostBinaireSplit[1]
$m = $PremierHostBinaireSplit[2]
$n = $PremierHostBinaireSplit[3]

# conversion en décimal
$k_Decimal = [convert]::ToInt32($k,2)
$l_Decimal = [convert]::ToInt32($l,2)
$m_Decimal = [convert]::ToInt32($m,2)
$n_Decimal = [convert]::ToInt32($n,2)


$AdresseIPPremierHost = "$k_Decimal.$l_Decimal.$m_Decimal.$n_Decimal"
#-------------------------------------------------------------------------------
# calcul de l'adresse de Broadcast

#Masque binaire sans les points
$compte0 = $Conversion_Masque -replace ("\.")

#calcul de l'index du dernier 1
$index1 = $Compte0.lastindexofany("1")

#avoir le nombre de bit à changer de 0 à 1
$nombre0 = 31 - $index1

#adresse de réseau binaire sans les points
$compte1 = $calcul_adresse_reseau_Binaire -replace ("\.")

#partie adresse broadcast a ne pas modifier
$Broadcast1_sans_point = $compte1.substring(0,$compte1.length -$nombre0)

#adresse de broadcast entiere sans les points ( ajout de 1 jusqu'a 32 caractères)
$Broadcast2_sans_point = $Broadcast1_sans_point.PadRight(32,'1')

# rajout des points à l'adresse de broadcast
$BroadcastBinaire = $Broadcast2_sans_point.ToString().Substring(0, 8) + "." + $Broadcast2_sans_point.ToString().Substring(8, 8) + "." + $Broadcast2_sans_point.ToString().Substring(16, 8) + "." + $Broadcast2_sans_point.ToString().Substring(24, 8) 

# conversion de l'adresse de broadcast en adresse IP

$BroadcastBinaireSplit = $BroadcastBinaire.Split(".")

$o = $BroadcastBinaireSplit[0]
$p = $BroadcastBinaireSplit[1]
$q = $BroadcastBinaireSplit[2]
$r = $BroadcastBinaireSplit[3]

# conversion en décimal
$o_Decimal = [convert]::ToInt32($o,2)
$p_Decimal = [convert]::ToInt32($p,2)
$q_Decimal = [convert]::ToInt32($q,2)
$r_Decimal = [convert]::ToInt32($r,2)

$AdresseIP_Broadcast = "$o_Decimal.$p_Decimal.$q_Decimal.$r_Decimal"
#--------------------------------------------------------------------------------
#Adresse du dernier host

$dernier_Host_Binaire = $BroadcastBinaire -replace (".$","0")

$dernier_Host_BinaireSplit = $dernier_Host_Binaire.Split(".")

$s = $dernier_Host_BinaireSplit[0]
$t = $dernier_Host_BinaireSplit[1]
$u = $dernier_Host_BinaireSplit[2]
$v = $dernier_Host_BinaireSplit[3]

# conversion en décimal
$s_Decimal = [convert]::ToInt32($s,2)
$t_Decimal = [convert]::ToInt32($t,2)
$u_Decimal = [convert]::ToInt32($u,2)
$v_Decimal = [convert]::ToInt32($v,2)

$AdresseIP_dernier_host = "$s_Decimal.$t_Decimal.$u_Decimal.$v_Decimal"

#---------------------------------------------------------------------------------------------
#affichage dans le terminal

write-host "Adresse IP du host en binaire      : $Conversion_AdresseIP" -ForegroundColor Cyan
write-host "Adresse IP du host                 : $AdresseIP" -ForegroundColor Green

write-host ""

write-host "Adresse IP du Masque en Binaire    : $Conversion_Masque" -ForegroundColor Cyan
write-host "Adresse IP Masque de sous-réseaux  : $Masque" -ForegroundColor Green 

Write-host ""

write-host "Adresse du Réseau en Binaire       : $calcul_adresse_reseau_Binaire" -ForegroundColor Cyan
Write-Host "Adresse IP du Réseau               : $AdresseIPReseau" -ForegroundColor Green

write-host ""

write-host "Adresse du premier host en binaire : $PremierHostBinaire" -ForegroundColor Cyan
Write-Host "Adresse IP du premier host         : $AdresseIPPremierHost" -ForegroundColor Green

Write-Host ""

Write-Host "Adresse IP du dernier host binaire : $dernier_Host_Binaire" -ForegroundColor Cyan
Write-Host "Adresse IP du dernier host         : $AdresseIP_dernier_host" -ForegroundColor Green

Write-Host ""

Write-Host "Adresse de Broadcast en binaire    : $BroadcastBinaire" -ForegroundColor Cyan
write-host "Adresse IP de Broadcast            : $AdresseIP_Broadcast" -ForegroundColor Green

write-host ""
Write-Host "Hôtes Total du réseau              : $HotesTotal" -ForegroundColor Green
write-host "------------------------------------------------------------------------"

write-host ""

pause

Clear-Host



}
#############################################################################################################
# 2.  Calcul réseau pour n'importe quelles IP

  2{


write-host "Masque de sous-réseaux     Notation CIDR    Hôtes Total" -ForegroundColor Green
Write-Host "----------------------     -------------    -----------" -ForegroundColor Green

Write-Host "128.0.0.0                  /1               2 147 483 646"
write-host "192.0.0.0                  /2               1 073 741 822"
Write-Host "224.0.0.0                  /3               536 870 910"
write-host "240.0.0.0                  /4               268 435 454"
Write-Host "248.0.0.0                  /5               134 217 726"
write-host "252.0.0.0                  /6               67 108 862"
Write-Host "254.0.0.0                  /7               33 554 430"
write-host "255.0.0.0                  /8               16 777 214"
write-host "255.128.0.0                /9               8 388 606"
write-host "255.192.0.0                /10              4 194 302"
write-host "255.224.0.0                /11              2 097 150"
write-host "255.240.0.0                /12              1 048 574"
write-host "255.248.0.0                /13              524 286"
write-host "255.252.0.0                /14              262 142"
write-host "255.254.0.0                /15              131 070"
write-host "255.255.0.0                /16              65 534"
write-host "255.255.128.0              /17              32 766"
write-host "255.255.192.0              /18              16 382"
write-host "255.255.224.0              /19              8 190"
write-host "255.255.240.0              /20              4 094"
write-host "255.255.248.0              /21              2 046"
write-host "255.255.252.0              /22              1 022"
write-host "255.255.254.0              /23              510"
write-host "255.255.255.0              /24              254"
write-host "255.255.255.128            /25              126"
write-host "255.255.255.192            /26              62"
write-host "255.255.255.224            /27              30"
write-host "255.255.255.240            /28              14"
write-host "255.255.255.248            /29              6"
write-host "255.255.255.252            /30              2"
write-host "255.255.255.254            /31"
write-host "255.255.255.255            /32"

Write-Host ""
Write-Host ""      

$AdresseIP = Read-host "Entrer une adresse IP"

Write-Host ""

$Masque = Read-Host "Entrer le masque de sous-réseaux au format Décimal/4octets"

write-host ""

# conversion de l'adress IP actuelle du PC en BInaire

# séparation des 4 éléments séparés par les points
$AdresseIPSplit = $AdresseIP.Split(".")

$a = $AdresseIPSplit[0]
$b = $AdresseIPSplit[1]
$c = $AdresseIPSplit[2]
$d = $AdresseIPSplit[3]

# conversion en base 2
$a_binaire = [convert]::ToString($a,2)
$b_binaire = [convert]::ToString($b,2)
$c_binaire = [convert]::ToString($c,2)
$d_binaire = [convert]::ToString($d,2)

#ajout de 0 à gauche avec un maximum de 8 chiffres au total
$a_binaireOctet = $a_binaire.PadLeft(8,'0')
$b_binaireOctet = $b_binaire.PadLeft(8,'0')
$c_binaireOctet = $c_binaire.PadLeft(8,'0')
$d_binaireOctet = $d_binaire.PadLeft(8,'0')

$Conversion_AdresseIP = "$a_binaireOctet.$b_binaireOctet.$c_binaireOctet.$d_binaireOctet"

#---------------------------------------------------------------------------------------

# conversion du masque de sous-réseau en Binaire

$MasqueSplit = $Masque.Split(".")

$e = $MasqueSplit[0]
$f = $MasqueSplit[1]
$g = $MasqueSplit[2]
$h = $MasqueSplit[3]

# conversion en base 2
$e_binaire = [convert]::ToString($e,2)
$f_binaire = [convert]::ToString($f,2)
$g_binaire = [convert]::ToString($g,2)
$h_binaire = [convert]::ToString($h,2)

#ajout de 0 à gauche avec un maximum de 8 chiffres au total
$e_binaireOctet = $e_binaire.PadLeft(8,'0')
$f_binaireOctet = $f_binaire.PadLeft(8,'0')
$g_binaireOctet = $g_binaire.PadLeft(8,'0')
$h_binaireOctet = $h_binaire.PadLeft(8,'0')

$Conversion_Masque = "$e_binaireOctet.$f_binaireOctet.$g_binaireOctet.$h_binaireOctet"

#---------------------------------------------------------------------------------------

# calcul de l'adresse réseau


#divison des adresses IP et Masque pour correspondance de chaque Bit ( 1+1=1, 1+0=0 , 0+0=0 )

# partie Adresse IP
$chiffre1 = $Conversion_AdresseIP[0]
$chiffre2 = $Conversion_AdresseIP[1]
$chiffre3 = $Conversion_AdresseIP[2]
$chiffre4 = $Conversion_AdresseIP[3]
$chiffre5 = $Conversion_AdresseIP[4]
$chiffre6 = $Conversion_AdresseIP[5]
$chiffre7 = $Conversion_AdresseIP[6]
$chiffre8 = $Conversion_AdresseIP[7]
$chiffre9 = $Conversion_AdresseIP[9]
$chiffre10 = $Conversion_AdresseIP[10]
$chiffre11 = $Conversion_AdresseIP[11]
$chiffre12 = $Conversion_AdresseIP[12]
$chiffre13 = $Conversion_AdresseIP[13]
$chiffre14 = $Conversion_AdresseIP[14]
$chiffre15 = $Conversion_AdresseIP[15]
$chiffre16 = $Conversion_AdresseIP[16]
$chiffre17 = $Conversion_AdresseIP[18]
$chiffre18 = $Conversion_AdresseIP[19]
$chiffre19 = $Conversion_AdresseIP[20]
$chiffre20 = $Conversion_AdresseIP[21]
$chiffre21 = $Conversion_AdresseIP[22]
$chiffre22 = $Conversion_AdresseIP[23]
$chiffre23 = $Conversion_AdresseIP[24]
$chiffre24 = $Conversion_AdresseIP[25]
$chiffre25 = $Conversion_AdresseIP[27]
$chiffre26 = $Conversion_AdresseIP[28]
$chiffre27 = $Conversion_AdresseIP[29]
$chiffre28 = $Conversion_AdresseIP[30]
$chiffre29 = $Conversion_AdresseIP[31]
$chiffre30 = $Conversion_AdresseIP[32]
$chiffre31 = $Conversion_AdresseIP[33]
$chiffre32 = $Conversion_AdresseIP[34]

# partie Masque
$chiffre1a = $Conversion_Masque[0]
$chiffre2a = $Conversion_Masque[1]
$chiffre3a = $Conversion_Masque[2]
$chiffre4a = $Conversion_Masque[3]
$chiffre5a = $Conversion_Masque[4]
$chiffre6a = $Conversion_Masque[5]
$chiffre7a = $Conversion_Masque[6]
$chiffre8a = $Conversion_Masque[7]
$chiffre9a = $Conversion_Masque[9]
$chiffre10a = $Conversion_Masque[10]
$chiffre11a = $Conversion_Masque[11]
$chiffre12a = $Conversion_Masque[12]
$chiffre13a = $Conversion_Masque[13]
$chiffre14a = $Conversion_Masque[14]
$chiffre15a = $Conversion_Masque[15]
$chiffre16a = $Conversion_Masque[16]
$chiffre17a = $Conversion_Masque[18]
$chiffre18a = $Conversion_Masque[19]
$chiffre19a = $Conversion_Masque[20]
$chiffre20a = $Conversion_Masque[21]
$chiffre21a = $Conversion_Masque[22]
$chiffre22a = $Conversion_Masque[23]
$chiffre23a = $Conversion_Masque[24]
$chiffre24a = $Conversion_Masque[25]
$chiffre25a = $Conversion_Masque[27]
$chiffre26a = $Conversion_Masque[28]
$chiffre27a = $Conversion_Masque[29]
$chiffre28a = $Conversion_Masque[30]
$chiffre29a = $Conversion_Masque[31]
$chiffre30a = $Conversion_Masque[32]
$chiffre31a = $Conversion_Masque[33]
$chiffre32a = $Conversion_Masque[34]


[int] $resultat1 = $chiffre1 + $chiffre1a
[int] $resultat2 = $chiffre2 + $chiffre2a
[int] $resultat3 = $chiffre3 + $chiffre3a
[int] $resultat4 = $chiffre4 + $chiffre4a
[int] $resultat5 = $chiffre5 + $chiffre5a
[int] $resultat6 = $chiffre6 + $chiffre6a
[int] $resultat7 = $chiffre7 + $chiffre7a
[int] $resultat8 = $chiffre8 + $chiffre8a
[int] $resultat9 = $chiffre9 + $chiffre9a
[int] $resultat10 = $chiffre10 + $chiffre10a
[int] $resultat11 = $chiffre11 + $chiffre11a
[int] $resultat12 = $chiffre12 + $chiffre12a
[int] $resultat13 = $chiffre13 + $chiffre13a
[int] $resultat14 = $chiffre14 + $chiffre14a
[int] $resultat15 = $chiffre15 + $chiffre15a
[int] $resultat16 = $chiffre16 + $chiffre16a
[int] $resultat17 = $chiffre17 + $chiffre17a
[int] $resultat18 = $chiffre18 + $chiffre18a
[int] $resultat19 = $chiffre19 + $chiffre19a
[int] $resultat20 = $chiffre20 + $chiffre20a
[int] $resultat21 = $chiffre21 + $chiffre21a
[int] $resultat22 = $chiffre22 + $chiffre22a
[int] $resultat23 = $chiffre23 + $chiffre23a
[int] $resultat24 = $chiffre24 + $chiffre24a
[int] $resultat25 = $chiffre25 + $chiffre25a
[int] $resultat26 = $chiffre26 + $chiffre26a
[int] $resultat27 = $chiffre27 + $chiffre27a
[int] $resultat28 = $chiffre28 + $chiffre28a
[int] $resultat29 = $chiffre29 + $chiffre29a
[int] $resultat30 = $chiffre30 + $chiffre30a
[int] $resultat31 = $chiffre31 + $chiffre31a
[int] $resultat32 = $chiffre32 + $chiffre32a
[int] $resultat33 = $chiffre33 + $chiffre33a
[int] $resultat34 = $chiffre34 + $chiffre34a


if ($resultat1 -eq 0 -or $resultat1 -eq 1 -or $resultat1 -eq 10)

{
$resultatBinaire1 = 0
}

if ($resultat1 -eq 11)

{
$resultatBinaire1 = 1
}

if ($resultat2 -eq 0 -or $resultat2 -eq 1 -or $resultat2 -eq 10)

{
$resultatBinaire2 = 0
}

if ($resultat2 -eq 11)

{
$resultatBinaire2 = 1
}

if ($resultat3 -eq 0 -or $resultat3 -eq 1 -or $resultat3 -eq 10)

{
$resultatBinaire3 = 0
}

if ($resultat3 -eq 11)

{
$resultatBinaire3 = 1
}

if ($resultat4 -eq 0 -or $resultat4 -eq 1 -or $resultat4 -eq 10)

{
$resultatBinaire4 = 0
}

if ($resultat4 -eq 11)

{
$resultatBinaire4 = 1
}

if ($resultat5 -eq 0 -or $resultat5 -eq 1 -or $resultat5 -eq 10)

{
$resultatBinaire5 = 0
}

if ($resultat5 -eq 11)

{
$resultatBinaire5 = 1
}

if ($resultat6 -eq 0 -or $resultat6 -eq 1 -or $resultat6 -eq 10)

{
$resultatBinaire6 = 0
}

if ($resultat6 -eq 11)

{
$resultatBinaire6 = 1
}

if ($resultat7 -eq 0 -or $resultat7 -eq 1 -or $resultat7 -eq 10)

{
$resultatBinaire7 = 0
}

if ($resultat7 -eq 11)

{
$resultatBinaire7 = 1
}

if ($resultat8 -eq 0 -or $resultat8 -eq 1 -or $resultat8 -eq 10)

{
$resultatBinaire8 = 0
}

if ($resultat8 -eq 11)

{
$resultatBinaire8 = 1
}

if ($resultat9 -eq 0 -or $resultat9 -eq 1 -or $resultat9 -eq 10)

{
$resultatBinaire9 = 0
}

if ($resultat9 -eq 11)

{
$resultatBinaire9 = 1
}

if ($resultat10 -eq 0 -or $resultat10 -eq 1 -or $resultat10 -eq 10)

{
$resultatBinaire10 = 0
}

if ($resultat10 -eq 11)

{
$resultatBinaire10 = 1
}

if ($resultat11 -eq 0 -or $resultat11 -eq 1 -or $resultat11 -eq 10)

{
$resultatBinaire11 = 0
}

if ($resultat11 -eq 11)

{
$resultatBinaire11 = 1
}

if ($resultat12 -eq 0 -or $resultat12 -eq 1 -or $resultat12 -eq 10)

{
$resultatBinaire12 = 0
}

if ($resultat12 -eq 11)

{
$resultatBinaire12 = 1
}

if ($resultat13 -eq 0 -or $resultat13 -eq 1 -or $resultat13 -eq 10)

{
$resultatBinaire13 = 0
}

if ($resultat13 -eq 11)

{
$resultatBinaire13 = 1
}

if ($resultat14 -eq 0 -or $resultat14 -eq 1 -or $resultat14 -eq 10)

{
$resultatBinaire14 = 0
}

if ($resultat14 -eq 11)

{
$resultatBinaire14 = 1
}

if ($resultat15 -eq 0 -or $resultat15 -eq 1 -or $resultat15 -eq 10)

{
$resultatBinaire15 = 0
}

if ($resultat15 -eq 11)

{
$resultatBinaire15 = 1
}

if ($resultat16 -eq 0 -or $resultat16 -eq 1 -or $resultat16 -eq 10)

{
$resultatBinaire16 = 0
}

if ($resultat16 -eq 11)

{
$resultatBinaire16 = 1
}

if ($resultat17 -eq 0 -or $resultat17 -eq 1 -or $resultat17 -eq 10)

{
$resultatBinaire17 = 0
}

if ($resultat17 -eq 11)

{
$resultatBinaire17 = 1
}

if ($resultat18 -eq 0 -or $resultat18 -eq 1 -or $resultat18 -eq 10)

{
$resultatBinaire18 = 0
}

if ($resultat18 -eq 11)

{
$resultatBinaire18 = 1
}

if ($resultat19 -eq 0 -or $resultat19 -eq 1 -or $resultat19 -eq 10)

{
$resultatBinaire19 = 0
}

if ($resultat19 -eq 11)

{
$resultatBinaire19 = 1
}

if ($resultat20 -eq 0 -or $resultat20 -eq 1 -or $resultat20 -eq 10)

{
$resultatBinaire20 = 0
}

if ($resultat20 -eq 11)

{
$resultatBinaire20 = 1
}

if ($resultat21 -eq 0 -or $resultat21 -eq 1 -or $resultat21 -eq 10)

{
$resultatBinaire21 = 0
}

if ($resultat21 -eq 11)

{
$resultatBinaire21 = 1
}

if ($resultat22 -eq 0 -or $resultat22 -eq 1 -or $resultat22 -eq 10)

{
$resultatBinaire22 = 0
}

if ($resultat22 -eq 11)

{
$resultatBinaire22 = 1
}

if ($resultat23 -eq 0 -or $resultat23 -eq 1 -or $resultat23 -eq 10)

{
$resultatBinaire23 = 0
}

if ($resultat23 -eq 11)

{
$resultatBinaire23 = 1
}

if ($resultat24 -eq 0 -or $resultat24 -eq 1 -or $resultat24 -eq 10)

{
$resultatBinaire24 = 0
}

if ($resultat24 -eq 11)

{
$resultatBinaire24 = 1
}

if ($resultat25 -eq 0 -or $resultat25 -eq 1 -or $resultat25 -eq 10)

{
$resultatBinaire25 = 0
}

if ($resultat25 -eq 11)

{
$resultatBinaire25 = 1
}

if ($resultat26 -eq 0 -or $resultat26 -eq 1 -or $resultat26 -eq 10)

{
$resultatBinaire26 = 0
}

if ($resultat26 -eq 11)

{
$resultatBinaire26 = 1
}

if ($resultat27 -eq 0 -or $resultat27 -eq 1 -or $resultat27 -eq 10)

{
$resultatBinaire27 = 0
}

if ($resultat27 -eq 11)

{
$resultatBinaire27 = 1
}

if ($resultat28 -eq 0 -or $resultat28 -eq 1 -or $resultat28 -eq 10)

{
$resultatBinaire28 = 0
}

if ($resultat28 -eq 11)

{
$resultatBinaire28 = 1
}

if ($resultat29 -eq 0 -or $resultat29 -eq 1 -or $resultat29 -eq 10)

{
$resultatBinaire29 = 0
}

if ($resultat29 -eq 11)

{
$resultatBinaire29 = 1
}

if ($resultat30 -eq 0 -or $resultat30 -eq 1 -or $resultat30 -eq 10)

{
$resultatBinaire30 = 0
}

if ($resultat30 -eq 11)

{
$resultatBinaire30 = 1
}

if ($resultat31 -eq 0 -or $resultat31 -eq 1 -or $resultat31 -eq 10)

{
$resultatBinaire31 = 0
}

if ($resultat31 -eq 11)

{
$resultatBinaire31 = 1
}

if ($resultat32 -eq 0 -or $resultat32 -eq 1 -or $resultat32 -eq 10)

{
$resultatBinaire32 = 0
}

if ($resultat32 -eq 11)

{
$resultatBinaire32 = 1
}





#--------------------------------------------------------------------------------

$calcul_adresse_reseau_Binaire = "$resultatBinaire1$resultatBinaire2$resultatBinaire3$resultatBinaire4$resultatBinaire5$resultatBinaire6$resultatBinaire7$resultatBinaire8.$resultatBinaire9$resultatBinaire10$resultatBinaire11$resultatBinaire12$resultatBinaire13$resultatBinaire14$resultatBinaire15$resultatBinaire16.$resultatBinaire17$resultatBinaire18$resultatBinaire19$resultatBinaire20$resultatBinaire21$resultatBinaire22$resultatBinaire23$resultatBinaire24.$resultatBinaire25$resultatBinaire26$resultatBinaire27$resultatBinaire28$resultatBinaire29$resultatBinaire30$resultatBinaire31$resultatBinaire32"


$calcul_adresse_reseau_BinaireSplit = $calcul_adresse_reseau_Binaire.Split(".")

$g = $calcul_adresse_reseau_BinaireSplit[0]
$h = $calcul_adresse_reseau_BinaireSplit[1]
$i = $calcul_adresse_reseau_BinaireSplit[2]
$j = $calcul_adresse_reseau_BinaireSplit[3]

# conversion en décimal
$g_Decimal = [convert]::ToInt32($g,2)
$h_Decimal = [convert]::ToInt32($h,2)
$i_Decimal = [convert]::ToInt32($i,2)
$j_Decimal = [convert]::ToInt32($j,2)

$AdresseIPReseau = "$g_Decimal.$h_Decimal.$i_Decimal.$j_Decimal"

#Calcul du premier Host --------------------------------------------------

$PremierHostBinaire = "$resultatBinaire1$resultatBinaire2$resultatBinaire3$resultatBinaire4$resultatBinaire5$resultatBinaire6$resultatBinaire7$resultatBinaire8.$resultatBinaire9$resultatBinaire10$resultatBinaire11$resultatBinaire12$resultatBinaire13$resultatBinaire14$resultatBinaire15$resultatBinaire16.$resultatBinaire17$resultatBinaire18$resultatBinaire19$resultatBinaire20$resultatBinaire21$resultatBinaire22$resultatBinaire23$resultatBinaire24.$resultatBinaire25$resultatBinaire26$resultatBinaire27$resultatBinaire28$resultatBinaire29$resultatBinaire30$resultatBinaire31" + "1"

$PremierHostBinaireSplit = $PremierHostBinaire.Split(".")

$k = $PremierHostBinaireSplit[0]
$l = $PremierHostBinaireSplit[1]
$m = $PremierHostBinaireSplit[2]
$n = $PremierHostBinaireSplit[3]

# conversion en décimal
$k_Decimal = [convert]::ToInt32($k,2)
$l_Decimal = [convert]::ToInt32($l,2)
$m_Decimal = [convert]::ToInt32($m,2)
$n_Decimal = [convert]::ToInt32($n,2)


$AdresseIPPremierHost = "$k_Decimal.$l_Decimal.$m_Decimal.$n_Decimal"
#-------------------------------------------------------------------------------
# calcul de l'adresse de Broadcast

#Masque binaire sans les points
$compte0 = $Conversion_Masque -replace ("\.")

#calcul de l'index du dernier 1
$index1 = $Compte0.lastindexofany("1")

#avoir le nombre de bit a changer de 0 à 1
$nombre0 = 31 - $index1

#adresse de réseau binaire sans les points
$compte1 = $calcul_adresse_reseau_Binaire -replace ("\.")

#partie adresse broadcast a ne pas modifier
$Broadcast1_sans_point = $compte1.substring(0,$compte1.length -$nombre0)

#adresse de broadcast entiere sans les points ( ajout de 1 jusqu'a 32 caractères)
$Broadcast2_sans_point = $Broadcast1_sans_point.PadRight(32,'1')

# rajout des points à l'adresse de broadcast
$BroadcastBinaire = $Broadcast2_sans_point.ToString().Substring(0, 8) + "." + $Broadcast2_sans_point.ToString().Substring(8, 8) + "." + $Broadcast2_sans_point.ToString().Substring(16, 8) + "." + $Broadcast2_sans_point.ToString().Substring(24, 8) 

# conversion de l'adresse de broadcast en adresse IP

$BroadcastBinaireSplit = $BroadcastBinaire.Split(".")

$o = $BroadcastBinaireSplit[0]
$p = $BroadcastBinaireSplit[1]
$q = $BroadcastBinaireSplit[2]
$r = $BroadcastBinaireSplit[3]

# conversion en décimal
$o_Decimal = [convert]::ToInt32($o,2)
$p_Decimal = [convert]::ToInt32($p,2)
$q_Decimal = [convert]::ToInt32($q,2)
$r_Decimal = [convert]::ToInt32($r,2)

$AdresseIP_Broadcast = "$o_Decimal.$p_Decimal.$q_Decimal.$r_Decimal"
#--------------------------------------------------------------------------------
#Adresse du dernier host

$dernier_Host_Binaire = $BroadcastBinaire -replace (".$","0")

$dernier_Host_BinaireSplit = $dernier_Host_Binaire.Split(".")

$s = $dernier_Host_BinaireSplit[0]
$t = $dernier_Host_BinaireSplit[1]
$u = $dernier_Host_BinaireSplit[2]
$v = $dernier_Host_BinaireSplit[3]

# conversion en décimal
$s_Decimal = [convert]::ToInt32($s,2)
$t_Decimal = [convert]::ToInt32($t,2)
$u_Decimal = [convert]::ToInt32($u,2)
$v_Decimal = [convert]::ToInt32($v,2)

$AdresseIP_dernier_host = "$s_Decimal.$t_Decimal.$u_Decimal.$v_Decimal"

#--------------------------------------------------------------------------------


write-host "Adresse IP du host en binaire      : $Conversion_AdresseIP" -ForegroundColor Cyan
write-host "Adresse IP du host                 : $AdresseIP" -ForegroundColor Green

write-host ""

write-host "Adresse IP du Masque en Binaire    : $Conversion_Masque" -ForegroundColor Cyan
write-host "Adresse IP Masque de sous-réseaux  : $Masque" -ForegroundColor Green 

Write-host ""

write-host "Adresse du Réseau en Binaire       : $calcul_adresse_reseau_Binaire" -ForegroundColor Cyan

Write-Host "Adresse IP du Réseau               : $AdresseIPReseau" -ForegroundColor Green

write-host ""

write-host "Adresse du premier host en binaire : $PremierHostBinaire" -ForegroundColor Cyan
Write-Host "Adresse IP du premier host         : $AdresseIPPremierHost" -ForegroundColor Green

Write-Host ""

Write-Host "Adresse IP du dernier host binaire : $dernier_Host_Binaire" -ForegroundColor Cyan
Write-Host "Adresse IP du dernier host         : $AdresseIP_dernier_host" -ForegroundColor Green

Write-Host ""

Write-Host "Adresse de Broadcast en binaire    : $BroadcastBinaire" -ForegroundColor Cyan
write-host "Adresse IP de Broadcast            : $AdresseIP_Broadcast" -ForegroundColor Green

write-host ""

pause

Clear-Host

  }

    ######################################################################################
  # 3. Conversion Adresse IP Decimal Vers Binaire”

    3{




write-host "Conversion d'Adresse IP en Binaire" -ForegroundColor Green

write-host ""

$IP = Read-host "entrer l'adresse IP"

# séparation des 4 éléments séparés par les points
$IPSplit = $IP.Split(".")

$a = $IPSplit[0]
$b = $IPSplit[1]
$c = $IPSplit[2]
$d = $IPSplit[3]

# conversion en base 2
$a_binaire = [convert]::ToString($a,2)
$b_binaire = [convert]::ToString($b,2)
$c_binaire = [convert]::ToString($c,2)
$d_binaire = [convert]::ToString($d,2)

#ajout de 0 à gauche avec un maximum de 8 chiffres au total
$a_binaireOctet = $a_binaire.PadLeft(8,'0')
$b_binaireOctet = $b_binaire.PadLeft(8,'0')
$c_binaireOctet = $c_binaire.PadLeft(8,'0')
$d_binaireOctet = $d_binaire.PadLeft(8,'0')

$Conversion = "$a_binaireOctet.$b_binaireOctet.$c_binaireOctet.$d_binaireOctet"

Write-Host ""

Write-Host "$IP = $Conversion"

Write-Host ""

pause

Clear-Host

}

  ######################################################################################
  # 4. Conversion Adresse IP Binaire Vers Decimal
  
   4{

   write-host "Conversion Binaire en adresse IP" -ForegroundColor Green

   write-host ""

$Binaire = Read-host "entrer l'adresse IP en Binaire sous la forme octet.octet.octet.octet"

$BinaireSplit = $Binaire.Split(".")

$a = $BinaireSplit[0]
$b = $BinaireSplit[1]
$c = $BinaireSplit[2]
$d = $BinaireSplit[3]

# conversion en décimal
$a_Decimal = [convert]::ToInt32($a,2)
$b_Decimal = [convert]::ToInt32($b,2)
$c_Decimal = [convert]::ToInt32($c,2)
$d_Decimal = [convert]::ToInt32($d,2)

$Conversion = "$a_Decimal.$b_Decimal.$c_Decimal.$d_Decimal"

Write-Host ""

Write-Host "$Binaire = $Conversion"

Write-Host ""

pause

Clear-Host



   }

#############################################################################################################
# x. exit

   x{
    exit
    }

    }

    }


until ($choix -eq "x")