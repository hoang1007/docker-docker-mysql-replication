# Cài đặt MySQL Replication sử dụng Docker Compose
Repo này thiết lập nhân bản 1 master - 2 slave sử dụng Docker Compose

## Yêu cầu
- Python
- Docker

## Cài đặt
Chạy câu lệnh sau để tự động thiết lập nhân bản:
```bash
bash run.sh
```

Sau khi thiết lập thành công, cửa sổ sẽ hiện trạng thái nhân bản của 2 slave tương tự như sau:
```console
*************************** 1. row ***************************
             Replica_IO_State: Waiting for source to send event
                  Source_Host: master
                  Source_User: slave1
                  Source_Port: 3306
                Connect_Retry: 60
              Source_Log_File: 1.000003
          Read_Source_Log_Pos: 1505
               Relay_Log_File: 09df70c12f7c-relay-bin.000002
                Relay_Log_Pos: 318
        Relay_Source_Log_File: 1.000003
           Replica_IO_Running: Yes
          Replica_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Source_Log_Pos: 1505
              Relay_Log_Space: 535
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Source_SSL_Allowed: No
           Source_SSL_CA_File: 
           Source_SSL_CA_Path: 
              Source_SSL_Cert: 
            Source_SSL_Cipher: 
               Source_SSL_Key: 
        Seconds_Behind_Source: 0
Source_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Source_Server_Id: 1
                  Source_UUID: 19fbb5bc-f342-11ed-af80-0242ac1b0002
             Source_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Source_Retry_Count: 86400
                  Source_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Source_SSL_Crl: 
           Source_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Source_TLS_Version: 
       Source_public_key_path: 
        Get_Source_public_key: 0
            Network_Namespace: 
```

## Sử dụng
Để thao tác với MySQL, sử dụng câu lệnh sau:

```bash
docker compose exec -it <container_name> mysql -u root -p
```

Giả sử muốn thao tác với MySQL trên master, ta sử dụng câu lệnh:

```bash
docker compose exec -it master mysql -u root -p
```

Note: Mật khẩu mặc định cho `root` là `1234`. Những tài khoản và mật khẩu khác được định nghĩa trong file [env.sh](./env.sh)