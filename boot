#!/bin/bash

case $1 in

  db:refresh)
    echo "about to rewrite db";
    dropdb --host=127.0.0.1 --port=5432 -e -U cendana_user cendana_db;
    createdb --host=127.0.0.1 --port=5432 -e -U cendana_user -O postgres cendana_db;
    ;;

  *)
    echo "unknown"
    ;;
esac
