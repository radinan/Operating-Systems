2 параметъра - име на файл (bar.csv) и име на директория. 

$1 => file
$2 => dir (containing txt files *.log)

Пример 1 (loz-gw.log):

Licensed features for this platform:
Maximum Physical Interfaces : 8
VLANs : 20
Inside Hosts : Unlimited
Failover : Active/Standby
VPN-3DES-AES : Enabled
*Total VPN Peers : 25
VLAN Trunk Ports : 8
This platform has an ASA 5505 Security Plus license.
Serial Number: JMX00000000
Running Activation Key: 0e268e0c


Пример 2 (border-lozenets.log):

Licensed features for this platform:
Maximum Physical Interfaces : 4
VLANs : 16
Inside Hosts : Unlimited
Failover : Active/Active
VPN-3DES-AES : Disabled
*Total VPN Peers : 16
VLAN Trunk Ports : 4
This platform has a PIX 535 license.
Serial Number: PIX5350007
Running Activation Key: 0xd11b3d48


Имената(loz-gw, border-lozenets) = hostname

Файлът bar.csv:

hostname,phy,vlans,hosts,failover,VPN-3DES-AES,peers,VLAN Trunk Ports,license,SN,key
loz-gw,8,20,Unlimited,Active/Standby,Enabled,25,8,ASA 5505 Security Plus,JMX00000000,0e268e0c
border-lozenets,4,16,Unlimited,Active/Active,Disabled,16,4,PIX 535,PIX5350007,0xd11b3d48

Полетата в генерирания от скрипта CSV файл не трябва да съдържат излишни trailing/leading
интервали. За улеснение, приемете, че всички whitespace символи във входните файлове са символа
“интервал”.










Пример 1 (loz-gw.log):

1.  Licensed features for this platform:
2.  
3.  Maximum Physical Interfaces : 8
4.  VLANs : 20
5.  Inside Hosts : Unlimited
6.  Failover : Active/Standby
7.  VPN-3DES-AES : Enabled
8.  *Total VPN Peers : 25
9.  VLAN Trunk Ports : 8
10. This platform has an ASA 5505 Security Plus license.
11. Serial Number: JMX00000000
12. Running Activation Key: 0e268e0c

tail -n -3;

1.  Maximum Physical Interfaces : 8
2.  VLANs : 20
3.  Inside Hosts : Unlimited
4.  Failover : Active/Standby
5.  VPN-3DES-AES : Enabled
6.  *Total VPN Peers : 25
7.  VLAN Trunk Ports : 8
8. This platform has an ASA 5505 Security Plus license.
9. Serial Number: JMX00000000
10. Running Activation Key: 0e268e0c

hostname,phy,vlans,hosts,failover,VPN-3DES-AES,peers,VLAN Trunk Ports,license,SN,key
loz-gw,8,20,Unlimited,Active/Standby,Enabled,25,8,ASA 5505 Security Plus,JMX00000000,0e268e0c

$filename,$1-$10

#except line 8
awk -F ': ' '{print $2}' | sed -e 's/^[[:space:]]*//g' -e 's/[[:digit:]]*$//'




