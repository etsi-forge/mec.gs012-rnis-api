#!/bin/bash

specfiles=$(ls | egrep "^[^.]*.(json|yaml)")

fres=0
for i in $specfiles ; do
    echo "-- Validating OpenAPI file $i..."
    swagger-tools validate $i
    res=$?
    fres=$(($fres||$res))
    echo -e "-- Validator returned $res.\n"
done

echo "-- Final validator returns $fres."
exit $fres
