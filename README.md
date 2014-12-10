(tahoe-node) docker-tahoe
============

What should work the best: `curl https://gist.githubusercontent.com/maccam912/de9301effbc13710a3aa/raw/efb2a28db829852ac97e9879148a1ce77afc62d4/tahoe-node.sh | bash`


To connect to the grid:

`docker run -it -p 3456:3456 -p 39499:39499 maccam912/tahoe-node /bin/bash`

The steps below can be combined easily, if you are comfortable with vim, into `vim /root/.tahoe/tahoe.cfg && /allmydata-tahoe-1.10.0/bin/tahoe start` or another editor by replacing `vim` at the beginning with your editor.

Once inside, on bash edit `/root/.tahoe/tahoe.cfg` and change nickname to something unique. Once you save the change, run:

`/allmydata-tahoe-1.10.0/bin/tahoe start`
