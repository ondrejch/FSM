#!/bin/bash
#
# Extract max pin power and mid-port flux
#
# Heating = power/ (UrodMass * UmetalHeatCap) * 60*60 [K/hour]

do_check=0

UmetalHeatCap=117.23    # Uranium metal heat capacity [J/(kg.K)]
UrodMass=5.6553         # Mass of uranium fuel pin [kg] 

echo "# CorePower [W]  PortFlux [n/cm^2/s]   PinMaxHeat [W]   PinHeating [K/hour]"
echo "#---------------------------------------------------------------------------------"

for d in $(ls -d powe*) ; do 
    power=$(echo $d | sed -e s/power.//g -e s/W//g) 
    portflux=$(grep -A1 DETportflux $d/ffrr.inp_det0.m | awk '{print $11}' | grep -e '[[:digit:]]') 
    maxheat=$(awk -v max=0 '/% a$/{if($2>max){want=$2; max=$2}}END{print want}' $d/ffrr.inp_core0.m)
    totheat=$(awk -v sum=0 '/% a$/{sum+=$2}END{print sum}' $d/ffrr.inp_core0.m)
    pinheating=$(awk -v m="$UrodMass" -v hc="$UmetalHeatCap" -v p="$maxheat" 'BEGIN{print 60.0*60.0* p/(m*hc)}')

    if [ $do_check -eq 1 ] ; then
        ppdet=$(awk -v sum=0 '/DETpinpower/,/]/{sum+=$11}END{print sum}' $d/ffrr.inp_det0.m )
        myrat=$(awk -v pinp="$totheat" -v pindet="$ppdet" 'BEGIN{print pinp/pindet}')
    fi
       
    if [ $do_check -eq 1 ] ; then
        echo "    $power         $portflux           $maxheat        $pinheating      $totheat   $ppdet    $myrat"
    else
        echo "    $power         $portflux           $maxheat        $pinheating"
    fi
done

# RESULTS- Liner scaling
#
# Flux in midpoint of port hole = 4.14966e+06 * core_power  [n/cm^2/s]
# Maximum pin power             = 0.00511806  * core_power  [W]
# Max power pin heating rate    = 0.0277916   * core_power  [K/hour]

