(tahoe-node) docker-tahoe
============

EASY WAY: `mkdir ~/storage && docker run -d -p 3456:3456 -p 39499:39499 -v ~/storage:/root/.tahoe/storage maccam912/tahoe-node /tahoe-run.sh`


To connect to the grid:

`docker run -it -p 3456:3456 -p 39499:39499 maccam912/tahoe-node /bin/bash`

The steps below can be combined easily, if you are comfortable with vim, into `vim /root/.tahoe/tahoe.cfg && /allmydata-tahoe-1.10.0/bin/tahoe start` or another editor by replacing `vim` at the beginning with your editor.

Once inside, on bash edit `/root/.tahoe/tahoe.cfg` and change nickname to something unique. Once you save the change, run:

`/allmydata-tahoe-1.10.0/bin/tahoe start`
