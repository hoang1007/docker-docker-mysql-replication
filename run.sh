source env.sh
docker compose down -v
docker compose up -d --remove-orphans

until docker compose exec master sh -c 'export MYSQL_PWD='$MASTER_MYSQL_PASSWORD'; mysql --protocol=tcp -u root -e ";"'
do
    echo "Initializing..."
    sleep 4
done

python setup.py
