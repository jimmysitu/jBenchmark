#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/../micro-benchmark/OpenDwarfs/build

# Full loading, long runtime
# ./gemnoui -p x -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1
# Full loading, short runtime
# ./gemnoui -p x -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1
# 50% loading, short runtime
# ./needle -p x -d 0 -- 20480 100 >/dev/null 2>&1


# GPU full loading
for i in {1..2}
do 
    for j in {1..4}
    do
        ./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1
    done
    # Earn thermal credit
    echo "GPU full loading interation $i done"
    sleep 30
done

# CPU full loading
for i in {1..2}
do
    for j in {1..2}
    do
        ./gemnoui -p 0 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1
    done
    echo "CPU full loading interation $i done"
    # Earn thermal credit
    sleep 30
done

# GPU half & CPU half
for i in {1..4}
do
	./needle -p 1 -d 0 -- 20480 100 >/dev/null 2>&1 &
	./needle -p 0 -d 0 -- 20480 100 >/dev/null 2>&1 &
    wait
    echo "CPU half & GPU half mix loading interation $i done"
done
sleep 20

# GPU full & CPU half
for i in {1..2}
do
	./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1 &
	./needle -p 0 -d 0 -- 20480 100 >/dev/null 2>&1 &
    wait
    echo "GPU full & CPU half mix loading interation $i done"
    # Earn thermal credit
    sleep 20
done

# GPU half & CPU full
for i in {1..2}
do
	./needle -p 1 -d 0 -- 20480 100 >/dev/null 2>&1 &
	./gemnoui -p 0 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1 &
    wait
    echo "GPU full & CPU half mix loading interation $i done"
    # Earn thermal credit
    sleep 20
done

# GPU full & CPU full
for i in {1..2}
do
	./gemnoui -p 1 -d 0 -- ../test/n-body-methods/gem/capsid 80 1 0 >/dev/null 2>&1 &
	./gemnoui -p 0 -d 0 -- ../test/n-body-methods/gem/nucleosome 80 1 0 >/dev/null 2>&1 &
    wait
    echo "GPU full & CPU full mix loading interation $i done"
    # Earn thermal credit
    sleep 20
done

