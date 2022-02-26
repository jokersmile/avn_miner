#!/bin/sh
#
# Choose nearest stratum:
#       stratum-ru.rplant.xyz   /Moscow/
#       stratum-eu.rplant.xyz   /London/
#       stratum-asia.rplant.xyz /Singapore/
#       stratum-na.rplant.xyz   /Toronto/
#
worker=$1
if [ -z "$worker" ]
then
    echo "Please enter worker name"
    exit 0
fi


FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
while [ 1 ]; do
"$FOLDER"/cpuminer-sse2 -a minotaurx -o stratum+tcps://stratum-us.rplant.xyz:17068 -u RAoSzVy3Jf8SwvQp6nJeyH6K6X43KHXoeL.${worker} --threads=7
currenttime=$(date +%H:%M)
if [[ "$currenttime" > "23:00" ]] || [[ "$currenttime" < "23:30" ]]; then
	sleep 1830
fi
sleep 5
done
