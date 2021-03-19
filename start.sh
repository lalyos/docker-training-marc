#!/bin/sh

cat > /var/www/html/index.html <<EOF
<h2>$TITLE</h2>
<body bgcolor="$COLOR">
$BODY
<hr/>
<hr/>
<a href="person.html">VIP list</a>
</body>
EOF

while ! mysql -h $DBHOST -u root mysql -e "select * from person"; do
  sleep 1
  echo waiting ....
done

mysql -h $DBHOST \
  -u root mysql \
  -e "select * from person"  \
  -H > /var/www/html/person.html

nginx -g "daemon off;"