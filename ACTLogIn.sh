echo "So you Want to loginto to ACT Portal? (y / n)"

read $varName

if [$varName == "y"  ]
then
    curl "http://portal.actcorp.in/web/blr/home"
else
    echo "Ok ! Nice talking to you! Bye Bye"
fi

