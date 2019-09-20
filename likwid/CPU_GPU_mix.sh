#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/../micro-benchmark/OpenDwarfs/build

## GPU full loading
#for i in {1..2}
#do 
#    for j in {1..4}
#    do
#	    ./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1 &
#	    ./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1 &
#    done
#    # GPU loading fence
#	./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1
#    # Earn thermal credit
#    echo "GPU full loading interation $i done"
#    sleep 30
#done
#
## CPU full loading
#for i in {1..4}
#do
#    for j in {1..4}
#    do
         ./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1
#    done
#    # CPU loading fence
#	likwid-bench -s 1s -t stream_avx -w S0:1MB:4 >/dev/null 2>&1
#    # Earn thermal credit
#    echo "CPU full loading interation $i done"
#    sleep 30
#done

for i in {1..2}
do
	./gemnoui -p 0 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1 & \
	./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1 && fg
    echo "CPU & GPU mix loading interation $i done"
done

for i in {1..2}
do
	./gemnoui -p 0 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1 & \
	./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1 && fg
    echo "CPU & GPU mix loading interation $i done"
    sleep 20
done

