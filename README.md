(tahoe-node) docker-tahoe
============
To connect to the grid:

`docker run -it -p 3456:3456 -p 38046:38046 maccam912/tahoe-node /bin/bash`

Once inside, on bash edit `/root/.tahoe/tahoe.cfg` and change nickname to something unique. Once you save the change, run:

`/allmydata-tahoe-1.10.0/bin/tahoe start`
