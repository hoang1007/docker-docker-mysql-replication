import os

def docker_exec(container_name, command, output=False):
    cmd = f'docker compose exec {container_name} sh -c'
    cmd += f""" '{command}'"""
    print(cmd)

    if output:
        return os.popen(cmd).read()
    else:
        os.system(cmd)

if __name__ == '__main__':
    slave1_username = 'slave1'
    slave2_username = 'slave2'
    slave_password = 'slave-password'
    priv_stmt1=rf'''
        CREATE USER \"{slave1_username}\"@\"%\" IDENTIFIED with mysql_native_password BY \"{slave_password}\";
        GRANT REPLICATION SLAVE ON *.* TO \"{slave1_username}\"@\"%\";
        FLUSH PRIVILEGES;
    '''
    priv_stmt2=rf'''
        CREATE USER \"{slave2_username}\"@\"%\" IDENTIFIED with mysql_native_password BY \"{slave_password}\";
        GRANT REPLICATION SLAVE ON *.* TO \"{slave2_username}\"@\"%\";
        FLUSH PRIVILEGES;
    '''

    docker_exec("master", f'export MYSQL_PWD={os.environ["MASTER_MYSQL_PASSWORD"]}; mysql -u root -e "{priv_stmt1}"')
    docker_exec("master", f'export MYSQL_PWD={os.environ["MASTER_MYSQL_PASSWORD"]}; mysql -u root -e "{priv_stmt2}"')

    master_status = docker_exec("master", f'export MYSQL_PWD={os.environ["MASTER_MYSQL_PASSWORD"]}; mysql -u root -e "SHOW MASTER STATUS"', output=True)
    master_status = master_status.split()
    current_log = master_status[5]
    current_pos = int(master_status[6])

    start_slave_stmt = rf"CHANGE REPLICATION SOURCE TO SOURCE_HOST=\"master\",SOURCE_USER=\"{slave1_username}\",SOURCE_PASSWORD=\"{slave_password}\",SOURCE_LOG_FILE=\"{current_log}\",SOURCE_LOG_POS={current_pos}; START REPLICA;"
    start_slave_cmd=f'export MYSQL_PWD={os.environ["SLAVE1_MYSQL_PASSWORD"]}; mysql -u root -e'
    start_slave_cmd+=' "'
    start_slave_cmd+=start_slave_stmt
    start_slave_cmd+='"'

    docker_exec("slave1", start_slave_cmd)
    docker_exec("slave1", f'export MYSQL_PWD={os.environ["SLAVE1_MYSQL_PASSWORD"]}; mysql -u root -e "SHOW REPLICA STATUS \G"')

    start_slave_stmt = rf"CHANGE REPLICATION SOURCE TO SOURCE_HOST=\"master\",SOURCE_USER=\"{slave2_username}\",SOURCE_PASSWORD=\"{slave_password}\",SOURCE_LOG_FILE=\"{current_log}\",SOURCE_LOG_POS={current_pos}; START REPLICA;"
    start_slave_cmd=f'export MYSQL_PWD={os.environ["SLAVE2_MYSQL_PASSWORD"]}; mysql -u root -e'
    start_slave_cmd+=' "'
    start_slave_cmd+=start_slave_stmt
    start_slave_cmd+='"'

    docker_exec("slave2", start_slave_cmd)
    docker_exec("slave2", f'export MYSQL_PWD={os.environ["SLAVE2_MYSQL_PASSWORD"]}; mysql -u root -e "SHOW REPLICA STATUS \G"')
