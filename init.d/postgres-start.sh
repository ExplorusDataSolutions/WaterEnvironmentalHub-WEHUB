#!/bin/bash

su postgres
cd /usr/local/pgsql/bin/
./pg_ctl start -D /usr/local/pgsql/data/
exit
