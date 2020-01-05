#!/usr/bin/env python3

from optparse import OptionParser
from datetime import datetime
from datetime import timedelta
import pyopencl as cl
import numpy as np

import time

MIN_ELAPSED = 0.25
KEY_LENGTH = 64
BUF_MAX_SIZE= 1024 * 1024

class BurnInTarget():
    def __init__(self, platform, kernel):
        self.name = platform.get_info(cl.platform_info.NAME)
        self.devices = platform.get_devices()
        self.context = cl.Context(self.devices)
        self.queue  = cl.CommandQueue(self.context)
        self.program = cl.Program(self.context, kernel).build()
        self.minXSize = 16
        self.minYSize = 16

        # Host bufs
        self.hostInfoBuf = np.array(range(2), dtype=np.uint32)
        self.hostInfoBuf[0] = 8 # Rounds for each kernel
        self.hostInfoBuf[1] = 8

        self.hostInBuf = np.random.rand(BUF_MAX_SIZE).astype(np.uint32)
        self.hostOutBuf = np.array(range(BUF_MAX_SIZE), dtype=np.uint32)

        # Device bufs
        self.devInfoBuf = cl.Buffer(self.context, cl.mem_flags.READ_ONLY | cl.mem_flags.COPY_HOST_PTR, hostbuf=self.hostInfoBuf)
        self.devInBuf = cl.Buffer(self.context, cl.mem_flags.READ_ONLY | cl.mem_flags.COPY_HOST_PTR, hostbuf=self.hostInBuf)
        self.devOutBuf = cl.Buffer(self.context, cl.mem_flags.WRITE_ONLY, self.hostOutBuf.nbytes)

    def burn(self, shape):
        event = self.program.burn(self.queue, shape, None, self.devInfoBuf, self.devInBuf, self.devOutBuf)
        return event

if __name__ == "__main__":

    parser = OptionParser()
    parser.add_option("-k", "--kernel",
                dest="kernel", default='default.cl',
                help="Kernel to burn in")

    (opts, args) = parser.parse_args()

    kernel = open(opts.kernel).read()

    # Get all available device and create context for each
    platforms = cl.get_platforms()

    targets = []
    for p in platforms:
        vendor = p.get_info(cl.platform_info.VENDOR)
        name = p.get_info(cl.platform_info.NAME)
        if('Intel' in vendor):
            print("Found platform: %s" % name)
            targets.append(BurnInTarget(p, kernel))

    # Tune runtime for each target
    for t in targets:
        xsize = 8
        ysize = 32
        print("Adjusting runtime for platform: %s" % t.name)
        elapsed = timedelta()
        while(elapsed.total_seconds() < MIN_ELAPSED):
            if(elapsed.total_seconds() < (MIN_ELAPSED/2)):
                xsize = xsize << 1
            else:
                xsize = xsize + 8

            # Get some power credit
            time.sleep(10)
            startTime = datetime.utcnow()

            event = t.burn((xsize, ysize))
            event.wait()

            endTime = datetime.utcnow()
            elapsed = endTime - startTime
            print("Kernel Elapsed Time: %s" % elapsed.total_seconds())

        t.minXSize = xsize
        t.minYSize = ysize
        print("Final min size: %d, %d" % (t.minXSize, t.minYSize))


#    # Burn in one by one
#    for t in targets:
#        print("Burning platform: %s" % t.name)
#        startTime = datetime.utcnow()
#
#        event = t.burn((8*t.minXSize, 2*t.minYSize))
#        event.wait()
#
#        endTime = datetime.utcnow()
#        elapsed = endTime - startTime
#        print("Kernel Elapsed Time: %s" % elapsed.total_seconds())
#        time.sleep(20)
#
#    # All together
#    events =[]
#
#    print("Burning platforms all together, at the same time")
#    startTime = datetime.utcnow()
#    for i in range(8):
#        for t in targets:
#            events.append(t.burn((8*t.minXSize, 2*t.minYSize)))
#
#    for e in events:
#        e.wait()
#
#    endTime = datetime.utcnow()
#    elapsed = endTime - startTime
#    print("Kernel Elapsed Time: %s" % elapsed.total_seconds())
#    time.sleep(30)

    time.sleep(30)
    print("Burning platforms with sequence")
    events =[]
    startTime = datetime.utcnow()
    for i in range(8):
        for t in sorted(targets, key=lambda x:x.name):
            events.append(t.burn((8*t.minXSize, 2*t.minYSize)))
            time.sleep(2)

    for e in events:
        e.wait()

    endTime = datetime.utcnow()
    elapsed = endTime - startTime
    print("Kernel Elapsed Time: %s" % elapsed.total_seconds())

    time.sleep(30)
    print("Burning platforms with reverse sequence")
    events =[]
    startTime = datetime.utcnow()
    for i in range(8):
        for t in sorted(targets, key=lambda x:x.name, reverse=True):
            events.append(t.burn((8*t.minXSize, 2*t.minYSize)))
            time.sleep(2)

    for e in events:
        e.wait()

    endTime = datetime.utcnow()
    elapsed = endTime - startTime
    print("Kernel Elapsed Time: %s" % elapsed.total_seconds())
    print("Burn in test done", flush=True)
    time.sleep(2)
